##### Homebrew (Apple Silicon) #################################################
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

##### Conda ####################################################################
# Prefer an existing conda in PATH; otherwise try Miniforge.
if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.zsh hook)"
else
  conda_path="$HOME/miniforge3/bin/conda"
  if [ -x "$conda_path" ]; then
    eval "$("$conda_path" shell.zsh hook)"
  fi
fi

##### Powerlevel10k instant prompt (keep near top) #############################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### zinit (plugin manager) ###################################################
# Optional: used by OMZ snippets, but not strictly required for zinit.
export ZSH="$HOME/.oh-my-zsh"

# Where to store zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Theme: Powerlevel10k
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh My Zsh snippets via zinit
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Completions/init
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
zinit cdreplay -q

##### Shell behavior / history / keybindings ##################################
bindkey "^[[3~" delete-char

HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
HIST_STAMPS="%Y-%m-%d %H:%M:%S"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Make interactive comments... comments again.
setopt interactive_comments

##### PATH #####################################################################
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

##### Editor ###################################################################
export EDITOR='code'

##### Smart aliases ############################################################
# Tool-based replacements
if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
fi
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi
if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
else
  alias ls='ls --color=auto'
fi

# Common quality-of-life
alias grep="grep -In --color=auto"
alias ll='ls -alF'
alias chx='chmod +x'
alias pi='python -m pip install'

# Git
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gs='git status'
alias checkpoint='git add . && git commit -m "checkpoint" && git push'

# GPG quick login (loopback demo)
alias gpg_login='echo "test" | gpg --pinentry-mode loopback --clearsign --passphrase-file ~/.gpg_passphrase'

# K9s (cluster shortcut)
# Project-specific aliases (such as for k9s) should be placed in a separate file (e.g., ~/.zshrc.local or ~/.zshrc.project)
# and sourced here if needed. Example:
# if [ -f ~/.zshrc.local ]; then
#   source ~/.zshrc.local
# fi

##### Functions ################################################################
mergewith() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: mergewith <reference_branch>"
    return 1
  fi
  local reference_branch="$1"

  local current_branch
  current_branch="$(git rev-parse --abbrev-ref HEAD)" || {
    echo "Error: Failed to determine the current git branch."
    return 1
  }
  echo "Current branch is $current_branch"

  git checkout "$reference_branch" || {
    echo "Error: Failed to checkout the reference branch '$reference_branch'."
    return 1
  }
  git pull || {
    echo "Error: Failed to pull the latest changes for branch '$reference_branch'."
    return 1
  }

  git checkout "$current_branch" || {
    echo "Error: Failed to checkout the current branch '$current_branch'."
    return 1
  }
  git pull || {
    echo "Error: Failed to pull the latest changes for branch '$current_branch'."
    return 1
  }

  git merge "$reference_branch" || {
    echo "Error: Failed to merge branch '$reference_branch' into '$current_branch'."
    return 1
  }

  echo "Successfully updated $current_branch with changes from $reference_branch."
}

reinstall() {
  conda activate base
  mamba remove --name pdf2tests --all
  mamba create -n pdf2tests -y python=3.11 pip ipython
  conda activate pdf2tests
  make install-deps
  python -m pip install graphviz
  python -m pip install \
    --config-setting="--global-option=build_ext" \
    --config-setting="--global-option=-I$(brew --prefix graphviz)/include/" \
    --config-setting="--global-option=-L$(brew --prefix graphviz)/lib/" \
    pygraphviz
  python -m pip install ipykernel
  python -m ipykernel install --user --name=pdf2tests
}

##### Extras ###################################################################
# zoxide (better cd)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Env files (guarded)
[ -f "$HOME/.env" ] && source "$HOME/.env"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
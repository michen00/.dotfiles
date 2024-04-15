# add homebrew to path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Theme
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Env variables and aliases
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/bin:$PATH"

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v exa &> /dev/null; then
  alias ls=exa
fi

# conda
conda_path=$HOME/miniforge3/bin/conda
if command -v $conda_path &> /dev/null; then
  eval "$($conda_path shell.zsh hook)"
fi

# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# more aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias chx='chmod +x'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gs='git status'
alias pi='python -m pip install'

alias checkpoint='git add . && git commit -m "checkpoint" && git push'

mergewith() {
    # Check if a reference branch is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: update_git_branch <reference_branch>"
        return 1
    fi

    local reference_branch=$1

    # Capture the current branch name
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to determine the current git branch."
        return 1
    fi

    echo "Current branch is $current_branch"

    # Checkout the reference branch and pull the latest changes
    git checkout $reference_branch
    if [ $? -ne 0 ]; then
        echo "Error: Failed to checkout the reference branch '$reference_branch'."
        return 1
    fi

    git pull
    if [ $? -ne 0 ]; then
        echo "Error: Failed to pull the latest changes for branch '$reference_branch'."
        return 1
    fi

    # Checkout the current branch again and pull the latest changes
    git checkout $current_branch
    if [ $? -ne 0 ]; then
        echo "Error: Failed to checkout the current branch '$current_branch'."
        return 1
    fi

    git pull
    if [ $? -ne 0 ]; then
        echo "Error: Failed to pull the latest changes for branch '$current_branch'."
        return 1
    fi

    # Merge the reference branch into the current branch
    git merge $reference_branch
    if [ $? -ne 0 ]; then
        echo "Error: Failed to merge branch '$reference_branch' into '$current_branch'."
        return 1
    fi

    echo "Successfully updated $current_branch with changes from $reference_branch."
}

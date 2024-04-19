# add homebrew to path
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(conda shell.$(basename $SHELL) hook)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="gnzh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="%Y-%m-%d %H:%M:%S"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# install commands for plugins
# curl -L git.io/antigen > antigen.zsh
# brew install conda-zsh-completion
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/conda-incubator/conda-zsh-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

source ~/antigen.zsh
# antigen init ~/.antigenrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles
antigen bundle command-not-found
antigen bundle docker
antigen bundle git
antigen bundle pip

# External plugins
antigen bundle esc/conda-zsh-completion
antigen bundle marlonrichert/zsh-autocomplete@main
# antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    command-not-found
    docker
    git
    pip
    # conda-zsh-completion
    # fast-syntax-highlighting
    # zsh-autocomplete
    # zsh-autosuggestions
    # zsh-completions
    # zsh-syntax-highlighting
)

# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# autoload -U compinit && compinit
autoload -Uz compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='code'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v exa &> /dev/null; then
  alias ls=exa
fi

alias chx='chmod +x'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias pi='python -m pip install'

alias ga='git add'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gs='git status'

alias checkpoint='git add . && git commit -m "checkpoint" && git push'

alias gpg_login='echo "test" | gpg --pinentry-mode loopback --clearsign --passphrase-file ~/.gpg_passphrase'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# conda
conda_path=$HOME/miniforge3/bin/conda
if command -v $conda_path &> /dev/null; then
  eval "$($conda_path shell.zsh hook)"
fi

# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

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

# krp(){
#     [ -z "$1" ] && echo "Usage: ${FUNCNAME} <pipeline_name>" && return 1
#     kedro run --pipeline "de_layout_$1" --env astm --params="doc_name=potato,doc_type=astm" # --to-nodes="$1".mark_redline
# }

alias _k9s='k9s --namespace ml --kubeconfig ~/creds/element-kube-dev.yaml'

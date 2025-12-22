export PATH="/usr/local/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/bin:$PATH"

EDITOR='code'

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
zstyle ':omz:update' mode auto # update automatically without asking
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
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-syntax-highlighting

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

if command -v nvim &>/dev/null; then
	alias vim=nvim
fi

if command -v bat &>/dev/null; then
	alias cat=bat
fi

if command -v exa &>/dev/null; then
	alias ls=exa
fi

alias chx='chmod +x'
alias grep='grep --color=auto'
alias ll='ls -alF --color=auto'
alias ls='ls --color=auto'
alias pi='python -m pip install'

alias gco='git checkout'
alias gcm='git commit -m'
alias gs='git status'
alias gst='git stash'
alias gfix='git commit --amend --no-edit'

alias checkpoint='git add . && git commit -m "chore: checkpoint" --no-verify && git push'

# alias gpg_login='echo "test" | gpg --pinentry-mode loopback --clearsign --passphrase-file ~/.gpg_passphrase'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zoxide
if command -v zoxide &>/dev/null; then
	eval "$(zoxide init zsh --cmd cd)"
fi

revert-to() {
	if [ "$#" -ne 2 ]; then
		echo "Usage: revert-to <commit-hash> <file-path>"
		return 1
	fi

	commit_hash="$1"
	file_path="$2"

	# Check for unstored changes in the file
	if git status --short "$file_path" | grep -q "^[ MADRCU?]"; then
		echo "The file '$file_path' has unstored changes."
		read -p "Are you sure you want to revert (y/n)? " confirm
		case "$confirm" in
		[yY][eE][sS] | [yY]) ;;
		*)
			echo "Aborted."
			return 0
			;;
		esac
	fi

	# Attempt to revert the file to the specified commit hash
	if git cat-file -e "$commit_hash"^{commit} 2>/dev/null; then
		git checkout "$commit_hash"^ -- "$file_path"
		if [ $? -eq 0 ]; then
			echo "Successfully reverted '$file_path' to commit '$commit_hash'."
		else
			echo "Failed to revert '$file_path'."
			return 1
		fi
	else
		echo "Invalid commit hash: '$commit_hash'."
		return 1
	fi
}

alias godmode='chmod -R u+rwx'
alias venvnow='rm -rf .venv && python -m venv .venv && source .venv/bin/activate && python -m pip install --upgrade pip'
alias ip='python -m IPython'
alias mainupdate='update-mine main'

export PATH="$PATH:$(go env GOPATH)/bin"

# Added by Windsurf
export PATH="/Users/Michael.Chen/.codeium/windsurf/bin:$PATH"

export BETTER_EXCEPTIONS=1

# RegEx alternation for conventional commit types
CONVENTIONAL_COMMITS="build|chore|ci|docs|feat|fix|perf|refactor|style|test|revert"

conventional_commit_widget() {
	# Intercepts command line input when the user presses Enter.
	# If the input matches the pattern of a conventional commit message
	# enclosed in single quotes (e.g., 'feat: add new feature'),
	# rewrites the command to a corresponding `git commit -m` invocation,
	# preserving any additional git commit arguments provided after the message.
	#
	# Pattern supported:
	#   '<type>(<scope>)?!?: <message>' [extra git args...]
	# where <type> is one of the conventional commit types (feat, fix, chore, etc.).
	#
	# This enables a seamless, efficient workflow for writing conventional
	# commits directly in the terminal with minimal keystrokes
	# while allowing flexibility for additional git commit flags.
	# You can save up to 14 keystrokes per commit message this way
	# (15 if you count the Shift key for a double quote).
	#
	# Example usage:
	#
	#   'feat: add a feature'
	#     --->
	#   git commit -m 'feat: add a feature'
	#
	#   'chore(optional-scope)!: make a breaking change' --no-verify
	#     --->
	#   git commit -m 'chore(optional-scope)!: make a breaking change' --no-verify
	#
	pattern="^'(${CONVENTIONAL_COMMITS})((\(.*\))?!?:)([^']+)'(.*)$"
	if [[ "$BUFFER" =~ $pattern ]]; then
		local msg="${match[1]}${match[2]}${match[4]}"
		local args="${match[5]}"
		BUFFER="git commit -m '${msg}'${args}"
		print -s -- "'${msg}'${args}"
		fc -AI
	fi
	zle accept-line
}
# Invoked as a Zsh line editor (zle) widget bound to the Enter key.
zle -N conventional_commit_widget
bindkey '^M' conventional_commit_widget

# See https://www.conventionalcommits.org/en/v1.0.0/ for more details on the format.
# If you want to use a different key binding, you can change '^M' to another key sequence.

conventional_commit_length_check() {
	# This function checks the length of the commit message summary
	# and displays a warning if it exceeds 50 characters.
	pattern="^'(${CONVENTIONAL_COMMITS}).+$"
	if [[ $BUFFER =~ $pattern ]] &&
		((${#BUFFER} > 51)) &&
		[[ $BUFFER == *:* ]] &&
		[[ ${BUFFER:51:1} != "'" ]] &&
		[[ ${BUFFER:1:50} != *"'"* ]]; then
		zle -M "⚠️ Conventional commit message summary is longer than 50 characters!"
		return
	fi
	zle -M "" # Clear the message if no issues
}
# Bind the hook to zle events
zle -N zle-line-pre-redraw conventional_commit_length_check

fpath+=~/.zfunc
autoload -Uz compinit
compinit -i

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

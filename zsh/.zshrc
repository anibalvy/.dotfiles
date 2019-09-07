# If you come from bash you might have to change your $PATH.
export PATH=/snap/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gvm colored-man-pages colorize kate nvm node vundle jsontoolsI lol react-native python virtualenv)

source $ZSH/oh-my-zsh.sh

#oh-my-zsh to automatically upgrade itself without prompting you, set the following in your ~/.zshrc:
#DISABLE_UPDATE_PROMPT=true

#To disable automatic upgrades, set the following in your ~/.zshrc:
#DISABLE_AUTO_UPDATE=true

#Manual Updates
#If you'd like to upgrade at any point in time (maybe someone just released a new plugin and you don't want to wait a week?) you just need to run:
#upgrade_oh_my_zsh

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias s="sudo"
alias sduo="sudo"
alias suod="sudo"
alias ll="ls -la"
alias isntall="install"
alias info='pinfo'
alias rm='rm -i'
if command -v pinfo > /dev/null 2>&1  ; then
	alias info='pinfo'
else 
	echo 'pinfo not installed, please install.'
fi


#export PAGER="/usr/bin/most -s"
#source .mancolors

## System Info
neofetch

## NODE VERSION MANAGER Selection

#export NVM_DIR="~/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm ///old - deprecated
# install with:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm // updated 20190823
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
##nvm use latest
nvm use --lts=dubnium

## GOLANG VERSION MANAGER Selection
# bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"

## GOLANG setup version
gvm use go1.12.9

## Colour to less command
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

## Pythonrc
export PYTHONSTARTUP="$HOME/.pythonrc"

#added by Anaconda3 installer
#export PATH="/opt/anaconda/anaconda3/bin:$PATH"

# fix touchscreen only to the screen
#~/.dotfiles/touchscreen/.touchscreen.sh

#CHEAT
export CHEAT_PATH="$CHEAT_PATH:$HOME/.cheat"
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=light # must be 'light' (default) or 'dark'


echo "Tmux sessions\n"
tmux list-sessions

tmux choose-session

tmux a

tmux

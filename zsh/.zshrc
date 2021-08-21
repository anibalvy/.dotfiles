# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
export PATH=export PATH=$HOME/.minishift/cache/oc/v3.11.0/linux:/opt/minishift/minishift-1.34.3-linux-amd64/:/snap/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:/opt/amdgpu-pro/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="honukai"
##kanibal- Install powerlevel10k
#https://github.com/romkatv/powerlevel10k
if [ $USER = 'root' ]; then 
	ZSH_THEME="honukai"
        echo "Theme: Honukai"
else
	ZSH_THEME="powerlevel10k/powerlevel10k"
        POWERLEVEL9K_MODE="nerdfont-complete"
        echo "Theme: PowerLevel 10K"
fi
##K

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
plugins=(adb aws git github colored-man-pages colorize docker docker-compose dotenv fzf golang helm kate kubectl lxd minikube nmap nvm node vundle jsontools lol sudo react-native python pyenv pipenv ufw zsh-syntax-highlighting zsh-autosuggestions)

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
#export LC_ALL=C
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
#export LC_TIME=en_US.UTF-8


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
# PACKAGE: is needed to install lsd package from https://github.com/Peltoche/lsd
# Fonts: also is needed a NERDFont.
alias ls="lsd  "  # PACKAGE: is needed to install lsd package from https://github.com/Peltoche/lsd
alias ll="lsd -lh --group-dirs=first"
alias la="lsd -lah --group-dirs=first"
alias isntall="install"
alias info='pinfo'
alias rm='rm -i'
alias cat='bat'
if command -v pinfo > /dev/null 2>&1  ; then
	alias info='pinfo'
else 
	echo 'pinfo not installed, please install.'
fi

# use vim mode
bindkey -v
# use emacs mode
#bindkey -e


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
nvm use --lts=erbium

## GOLANG VERSION MANAGER Selection
# bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

## GOLANG setup version
gvm use go1.16.6

## Colour to less command
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Pythonrc
export PYTHONSTARTUP="$HOME/.pythonrc"

# Python PyENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - )"
echo "PyENV Global version:"
echo "$(python -V)"
# I commented pyenv virtualenv because is 100% better to manage them with ****pipenv****.
#eval "$(pyenv virtualenv-init -)"
# *** use pipenv for virtualenv
# Commands
# pyenv install --list 
# pyenv install 2.7.8
# pyenv global 3.6.8
# pyenv local 2.7.15
# pyenv uninstall 2.7.15
# pyenv versions
# pyenv commands
# pyenv shims --help
# pyenv which pip
# Create Virtual Env:
# pyenv virtualenv <python_version> <environment_name>
# pyenv virtualenv 3.6.8 myproject
# Activate Virtual Env:
# pyenv local myproject
# manually activate/deactivate your Python versions:
# pyenv activate <environment_name>
# pyenv deactivate
#
#pip completion --zsh 
# pip install flask
# pip freeze > requirements.txt

#added by Anaconda3 installer
#export PATH="/opt/anaconda/anaconda3/bin:$PATH"

# fix touchscreen only to the screen
#~/.dotfiles/touchscreen/.touchscreen.sh

#CHEAT
export CHEAT_PATH="~/.cheat"
export CHEAT_CONFIG_PATH="~/.config/cheat/conf.yml"
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=light # must be 'light' (default) or 'dark'
export CHEAT_USE_FZF=true
source ~/.config/cheat/cheat.zsh

#CLING
export PATH=$HOME/Development/CLang/cling/cling_2019-11-22_ubuntu18/bin:$PATH

# Tmux must be disable if we are running inside a pipenv VirtualENV (pipenv shell)
alias tmux='tmux -2'
if [  -z "$PIPENV_ACTIVE" ] ; then
    if [ $USER != 'root' ]; then
        #env | grep TMUX
        if [ -n "$TMUX" ]; then 
            #echo "\nTmux pane $TMUX_PANE....\n"
            #tmux list-sessions
            #tmux choose-session
            #tmux a
        else
            echo 'sessions'
            tmux ls
            if read -q "load_tmux?Do you want to load TMUX [Y/n]"; then
                echo '\n'
                if read -q "new_session?Tmux new session [Y/n]"; then
                    tmux new-session 
                else
                    tmux a
                fi 
            fi
        fi
    else
        echo "WARNIGN: logged as user root!!!"
        echo "     - No autmatic Tmux session to avoid nested sessions"
        echo "     - be carefull!!"
    fi
else
    echo 'Loading a Python Virtual enviroment'
fi

### vi mode
#
# How to do history search (basically /<filter>  and qirh "n" find the needed...
#"/" vi-history-search-backward
#"?" vi-history-search-forward
#"n" vi-repeat-search
#"N" vi-rev-repeat-search

### colorize man pages with BAT (sudo pkcon install bat)
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

## aws cli auto completer -- installed manually from the zip
complete -C aws_completer aws

# Using FZF, check https://www.youtube.com/watch?v=qgG5Jhi_Els
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

pdf-combine() { gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=combinedpdf_`date +'%F_%Hh%M'`.pdf -f "$@" ;}
alias combine-pdf='pdf-combine'
# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh
if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi

alias kb='kubecolor'

source ~/.minikube-completion-zsh
source ~/.minishift-completion-zsh
source ~/.gh-github-completion-zsh
source ~/.yq-shell-completion-zsh



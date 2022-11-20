
# NOTE:
#       THIS IS CALLED ONLY IN LOGIN SHELL (mainly at boot)
#       and not Interactive (on scripts and new virtual shells)

# this loads in tmux panes
#echo  $PATH
# Python PyENV
# 20221012
#export PYENV_ROOT="$HOME/.pyenv"
export PYENV_ROOT="/home/kanibal/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT:$PATH"
#export PIPENV_PYTHON="$PYENV_ROOT/python"
#eval "$(pyenv init --path )"
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



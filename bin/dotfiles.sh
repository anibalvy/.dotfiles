#/bin/bash
# simple version for update and deploy dotfiles.
# Note: by using stow command implies that files must be removed previously.
# TODO:
# - option for automatically remove files to be deployed
# - option to use current user files as stow.


echo "checking tools:"

#OH MY ZSH 
if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
	echo "   - OH MY ZSH found"
else
	while true; do
            read -p "OH MY ZSH not installed: do you want to install it: [Y/n}" yn
            case $yn in
                [Yy]* ) 
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
			break;;
                [Nn]* ) 
			echo "skipping OH MY ZSH installation"; 
			break;;
                * ) 
			echo "Please answer yes or no.";;
               esac
        done
fi

#OH MY ZSH - POWERLEVEL10K
if [ -f ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]; then
	echo "   - Powerlevel10K found"
else
	while true; do
            read -p "Powerlevel10K not installed: do you want to install it: [Y/n}" yn
            case $yn in
                [Yy]* ) 
			ZSH_CUSTOM=~/.oh-my-zsh/custom
			git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
			break;;
                [Nn]* ) 
			echo "skipping Powerlevel10K installation"; 
			break;;
                * ) 
			echo "Please answer yes or no.";;
            esac
        done
fi

#Node Version Manager
if [ -f ~/.nvm/nvm.sh ]; then
	echo "   - nvm command found"
else
	while true; do
            read -p "nvm not installed: do you want to install it: [Y/n}" yn
            case $yn in
                [Yy]* ) 
			curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
			break;;
                [Nn]* ) 
			echo "skipping nvm installation"; 
			break;;
                * ) 
			echo "Please answer yes or no.";;
        esac
done
fi

#PyENV
if [ -f ~/.pyenv/bin/pyenv ]; then
	echo "   - pyenv command found"
else
	while true; do
            read -p "pyenv not installed: do you want to install it: [Y/n}" yn
            case $yn in
                [Yy]* ) 
			git clone https://github.com/pyenv/pyenv.git ~/.pyenv
			echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
			echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
			echo "Luego seleccionar versiones de python con"
			echo " pyenv global system"
			echo " pyenv local 2.17.6"
			echo " pyenv local 3.8.0"
			echo "\nPara Virtual Enviroment usar pipenv"
			echo "Instalar pipenv con pip/pip3 install pipenv"
			echo "pipenv install"
			break;;
                [Nn]* ) 
			echo "skipping pyenv installation"; 
			break;;
                * ) 
			echo "Please answer yes or no.";;
        esac
done
fi

#Set up Vundle
if [ -d ~/.vim/bundle/Vundle.vim ]; then
	echo "   - Vim Vundle found"
else
	while true; do
            read -p "Vim Vundle not installed: do you want to install it: [Y/n}" yn
            case $yn in
                [Yy]* ) 
			git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

			break;;
                [Nn]* ) 
			echo "skipping nvm installation"; 
			break;;
                * ) 
			echo "Please answer yes or no.";;
        esac
done
fi
# Using stow to manage installation of config files
# if a file named ".nostow" is present, that folder 
# will not be installed
echo "\n\nInstalling dotfiles."
cd ~/.dotfiles/
for i in $(ls | egrep -v "bin|readme|LICENSE"); do
    # find if folder not needed to be processed
    FILE=~/.dotfiles/$i/.nostow
    if [ ! -f "$FILE" ] ; then
        echo "   - dotfiles of $i to be deployed.... \n"
        stow $i
    else
        echo "   - dotfiles of $i to be ignored (.nostow file present)  \n"
    fi
done



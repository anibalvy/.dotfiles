#/bin/bash
# simple version for update and deploy dotfiles.
# Note: by using stow command implies that files must be removed previously.
# TODO:
# - option for automatically remove files to be deployed
# - option to use current user files as stow.

cd ~/.dotfiles/
for i in $(ls | egrep -v "bin|readme|LICENSE"); 
do
    FILE=~/.dotfiles/$i/.nostow
    if [ ! -f "$FILE" ] ; 
    then
        echo "dotfiles of $i to be deployed.... \n"
        stow $i
    else
        echo "dotfiles of $i to be ignored (.nostow file present)  \n"
    fi
done



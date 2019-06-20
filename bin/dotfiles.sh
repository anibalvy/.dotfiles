#/bin/bash


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



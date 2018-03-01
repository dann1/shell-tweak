#!/bin/bash

# Sample script for installing

cd ~
rsync -av --progress dann1@192.168.2.1:~/Projects/shell-tweak/ .shell-tweak

if [[ $? -eq 0 ]]; then
        mv .bash_history bash_history
        rm .bash*
        ln -s ~/.shell-tweak/.* .
        mv bash_history .bash_history
        rm ~/shell-tweak.sh
fi

cd -
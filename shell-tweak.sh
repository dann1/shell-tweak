#!/bin/bash

# Sample script for installing

cd ~
mv  shell-tweak/ .shell-tweak

if [[ $? -eq 0 ]]; then
        mv .bash_history bash_history
        rm .bash*
        ln -s ~/.shell-tweak/.* .
        mv bash_history .bash_history
fi

cd -
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length
HISTSIZE=1000; HISTFILESIZE=2000

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#####################################################################################################

# colors
GREEN="\[$(tput setaf 46)\]"
BLUE="\[$(tput setaf 26)\]"
RED="\[$(tput setaf 196)\]"
RESET="\[$(tput sgr0)\]"

# man color
for i in \
		LESS_TERMCAP_me=$(printf '\e[0m') \
		LESS_TERMCAP_se=$(printf '\e[0m') \
		LESS_TERMCAP_ue=$(printf '\e[0m') \
		LESS_TERMCAP_mb=$(printf '\e[1;32m') \
		LESS_TERMCAP_md=$(printf '\e[1;34m') \
		LESS_TERMCAP_us=$(printf '\e[1;32m') \
		LESS_TERMCAP_so=$(printf '\e[1;44;1m') \
		; do
		export $i 
done

# load files 
for i in "aliases exports bash-functions.sh"; do
	source ~/.$i
done

# set user prompt
if [[ $USER == 'root' ]]; then
	ucolor=${RED}; last="#"
else 
	ucolor=${GREEN}; last="$"
fi

# happy face / sad face
function exitstatus()
{
    if [[ $? == 0 ]]; then
        echo -en '\033[1;32m'":)"'\E(B\E[m'
    else
        echo -en '\033[1;31m'":("'\E(B\E[m'
    fi
}

# final prompt
PS1='$(exitstatus) '"$RED[$ucolor\u\[\e[m\]\[\e[m\]@$BLUE\h\[\e[m\] $GREEN\W$RED]\e[m\]$last " 
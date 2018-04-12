# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
if [ $TERM="xterm-256color" ]
then
	eval `dircolors ~/.dir_colors`
	#PS1='\[\033[01;38;5;61m\]\u@\h\[\033[01;38;5;107m\] \w\n\$\[\033[01;38;5;248m\]'
else
	LS_COLORS='no=00:fi=00:di=01;34;40:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;35:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.svg=01;35:*.dl=01;35:*.pl=31:*.sh=33:*.fa=01;32:*.fasta=01;32:*.contig=01;32:*.scafSeq=01;32:*.cds=01;32:*.pep=01;32:*.gff=32:*.gtf=32:*.agp=32:*.fq=36:*.pair=36:*.single=36:*.soap=36:*.bam=36:*.sam=36:*.fai=36:*.psl=35:*.m8=35:*.log=01;37:*.txt=01;37:*.nif=01;37:*.lst=01;37:*.list=01;37:*.stat=01;37:*.cfg=01;37:'
	export LS_COLORS
	#PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w\n\$\[\033[00m\]'
fi


# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


black='\[\e[1;30m\]'
red='\[\e[1;31m\]'
green='\[\e[1;32m\]'
brown='\[\e[1;33m\]'
blue='\[\e[1;34m\]'
purple='\[\e[1;35m\]'
cyan='\[\e[1;36m\]'
white='\[\e[1;37m\]'
endColor='\[\e[0m\]'


export PS1="${brown}\u ${purple}\t  \$(if [ \$? = 0 ]; then echo \[\e[36m\]^_^ "\\w"\[\e[0m\]; else echo \[\e[31m\]0_0 "\\w"\[\e[0m\]; fi)  ${green}\n\$$endColor "
export PS2="${green}continue-> $endColor"

#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias grep='grep --color=auto'
alias c='clear'
alias ebr='vi ~/.bashrc'
alias sbr='. ~/.bashrc'
alias wl='wc -l'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias g='g++'
alias E='exit'
alias cc='gcc'
alias cls='printf "\033c"'
# start redshift
alias dfh='df -h'
# connection to clusters

alias py='python'
alias ipy='ipython'

alias le='less -S --RAW-CONTROL-CHARS'

# alias for nginx
alias ng="sudo /usr/local/nginx/sbin/nginx"



# for colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# for colorful man pages using most
# setenv PAGER /usr/local/bin/most
export PAGER="/usr/bin/most -s"

function mc() {
	mkdir -p "$@" && eval cd "\"\$$#\"";
}

function bgrep() {
	grep "$1" ~/.bashrc
}

function echon() {
	head -n $1 $2 | tail -1
}

echo -e "\e[1;31mDid you know that:\e[0m"; whatis $(\ls /bin | shuf -n 1) | xargs echo -e "\e[1;32m"

# openssl
export OPENSSL=/usr/local/openssl/bin
export PATH=$OPENSSL:$PATH:$HOME/bin

C_INCLUDE_PATH=/usr/local/openssl/include/
export C_INCLUDE_PATH 
CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/openssl/include/
export CPLUS_INCLUDE_PATH


#!/bin/bash

# aliases for convenience

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

#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias grep='grep --color=auto'
alias c='clear'
alias ebr='vim ~/.bashrc'
alias sbr='. ~/.bashrc'
alias eba="vim ~/.bash_aliases"
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

# aliased for git
alias gs="git status"
alias gm="git commit"
alias ga="git add"
alias gp="git push"


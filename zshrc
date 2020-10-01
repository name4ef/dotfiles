################################################################################
#
# Functions
#

todo() {
	LANG=en_US.UTF-8
	if [ -s NOTES ] && [ -s README ]; then
		vim NOTES -c 'vsp README' -c 'sp TODO' -c 'winc l' -c 'sp ChangeLog' \
			-c 'winc h'
	elif [ -s NOTES ]; then
		vim NOTES -c 'vsp TODO' -c 'winc l' -c 'sp ChangeLog' -c 'winc h'
	else
		vim -O TODO ChangeLog
	fi
}

settitle() {
	#printf "\033k$1\033\\"
	echo -ne "\033]0;$1"
}

workflow() {
    CALC_STR="0"

    task workflow
    for UUID in `task end.after:som-1m status:completed uuids`; do 
        CALC_STR="$CALC_STR + $(task calc $UUID.totalactivetime)"
    done 
    echo $CALC_STR
    task calc $CALC_STR
}

task_info() {
    IDS=`task +ACTIVE ids`

    if [ $IDS ]; then
        echo "$IDS "
    fi
}

run_with_bat()
{
    batfile=$1; shift
    tmpfile="$TMP/tmp$$.bat"
    echo "@echo off" > $tmpfile
    echo "call \"%$batfile%vsvars32.bat\" >NUL:" >> $tmpfile
    echo "bash -c \"%*\"" >> $tmpfile
    cmd /c `cygpath -m "$tmpfile"` "$@"
    status=$?
    rm -f $tmpfile
    return $status
}

run_vs14()
{
    run_with_bat VS140COMNTOOLS "$@"
}

# copy/paste selected text to system clipboard
# TODO use xclip or xsel for other Unix-like
function vi-yank-xclip
{
	zle vi-yank
	echo "$CUTBUFFER" | pbcopy
}

function vi-put-after-xclip
{
	CUTBUFFER="$(pbpaste)"
	zle vi-put-after
}

zle -N vi-yank-xclip
zle -N vi-put-after-xclip

bindkey -M vicmd 'y' vi-yank-xclip
bindkey -M vicmd 'p' vi-put-after-xclip

################################################################################

if [ `uname` = "Darwin" ]; then
    export LANG=en_US.UTF-8
fi
#export TERM=xterm-256color
case "$TERM" in
	xterm*) TERM=xterm-256color
esac 
if [ $TERM = "screen-256color" ]; then
	alias mc="TERM=xterm-256color mc"
fi
export PATH=$PATH:~/.bin:/usr/lib64/java/bin:~/Qt/Tools/QtCreator/bin:/usr/local/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/isdrill/aidriller/bin_release
#export PS1='\h:\W \u\$ '
#export PROMPT_COMMAND='$(settitle $HOST:$PWD)'
export EDITOR=vim
if [ `whoami` = "root" ]; then
	#export PS1=$'%~\e[0;31m#\e[0m ' # TODO
	export PS1=$'%~# '
else
	export PS1='%~: '
fi
export TZ="Asia/Tomsk"
export PAGER="less -RF"
setopt PROMPT_SUBST
autoload -U colors && colors
#PROMPT='`echo -e "\033[$LINES;0f";task_info`%~: '
PROMPT='`task_info`%~: '
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
TMOUT=60

TRAPALRM() {
    zle reset-prompt
}

# The following lines were added by compinstall
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/name4ef/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

################################################################################
#
# Colorization
#

#alias ls='ls --color' # it doesn't work on mac
#LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#export LS_COLORS


sdcv() {
    /usr/bin/sdcv --non-interactive $@ \
        | less --quit-if-one-screen --no-init
}

if [ `uname -s` = "Darwin" ]; then
    alias rsync='rsync -a --progress'
else
    alias rsync='rsync -a --info=progress2'
fi

setopt rmstarsilent # disable confirmation when removing through rm -rf dir/

alias grep='grep --color'
#alias less='less -R'
#alias cat='pygmentize -g'
alias silence='sudo /usr/sbin/pm-suspend'
alias youtube='youtube-viewer --video-player=mpv -colorful --subs-order=unread \
    --highlight'
alias goodjokes='youtube-viewer --video-player=mpv -colorful --subs-order=unread \
    --highlight -cv UC10vOab44D5_fsW70ni4m9g'
alias svnup='svn up ~/almato/*'
alias svndi='svn di | vim -'
alias svnci="svn ci -m ''"
alias svnst="svn st ~/almato/* | grep -v '^?'"
alias yota='sh ~/almato/sysadm/modem/post_request.sh'
alias tw='timew $*'
alias tww='timew week'
alias twd='timew day'
alias twm='timew month'
alias tww_work='timew week isdrill'
alias twd_work='timew day isdrill'
alias twm_work='timew month isdrill'
alias ruw='wikipedia2text -l ru -p -X "-cols $COLUMNS" $*'
alias enw='wikipedia2text -l en -p -X "-cols $COLUMNS" $*'
alias cl='run_vs14 cl $*'
alias calibre_push='rsync --del -L ~/Calibre\ Library eas:'
alias calibre_pull='rsync --del eas:Calibre\\\ Library ~/'

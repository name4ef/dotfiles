RED='\033[0;31m'
NC='\033[0m' # No Color

################################################################################
#
# Functions
#

todo()
{
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

settitle()
{
	#printf "\033k$1\033\\"
	echo -ne "\033]0;$1"
}

workflow()
{
    CALC_STR="0"

    task workflow
    for UUID in `task end.after:som-1m status:completed uuids`; do 
        CALC_STR="$CALC_STR + $(task calc $UUID.totalactivetime)"
    done 
    echo $CALC_STR
    task calc $CALC_STR
}

task_info()
{
    IDS=`task +ACTIVE ids`

    if [ $IDS ]; then
        echo "$IDS "
    fi
}

precmd()
{
    printf '\033]2;%s\033\\' `hostname -f` # for restore of tmux's pane-title
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

sdcv()
{
    /usr/bin/sdcv --non-interactive $@ \
        | less --quit-if-one-screen --no-init
}

# TODO
# - [ ] make possible work with more then one argument
#       ex: ssh somehost -L 8081:localhost:80
# - [ ] appending by tab for scp
#ssh()
#{
#    if [ ! -z $TMUX ]; then
#        tmux rename-window $1
#        /usr/bin/ssh $1
#        tmux set-option automatic-rename off
#        tmux set-option automatic-rename on
#    else
#        /usr/bin/ssh $1
#    fi
#}

alias rsync='rsync -a --info=progress2'
XSEL=xsel

if [ `uname` = "Darwin" ]; then
    export LANG=en_US.UTF-8
    alias rsync='rsync -a --progress'
    XSEL=pbcopy
fi

# copy/paste selected text to system clipboard
function vi-yank-xclip
{
	zle vi-yank
	echo "$CUTBUFFER" | $XSEL
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

#export TERM=xterm-256color
case "$TERM" in
	xterm*) TERM=xterm-256color
esac 
if [ $TERM = "screen-256color" ]; then
	alias mc="TERM=xterm-256color mc"
fi
export PATH=/usr/lib/ccache/bin:~/.bin:~/.local/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=~/.local/lib:/usr/local/lib:$LD_LIBRARY_PATH
export CCACHE_DIR="/var/cache/ccache"
#export PS1='\h:\W \u\$ '
#export PROMPT_COMMAND='$(settitle $HOST:$PWD)'
export EDITOR=vim
export TZ="Asia/Tomsk"
setopt PROMPT_SUBST
autoload -U colors && colors

if [ `whoami` = "root" ]; then
	export PS1=$'%~: `printf ${RED}`#`printf ${NC}` '
else
    export PS1='`task_info`%~: '
fi
PROMPT=$PS1

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

setopt rmstarsilent # disable confirmation when removing through rm -rf dir/

# https://github.com/benley/solarized-termcolor-osc4.git
SOLARIZED=~/dev/solarized-termcolor-osc4/solarized.sh
if [ -f $SOLARIZED ] && [ -z ${SSH_CLIENT+x} ] && (( $SHLVL == 1 )); then
    source $SOLARIZED
    cset 7 $base1
fi

if [ `uname` = "Darwin" ]; then
    eval `gdircolors ~/.dotfiles/dircolors.solarized-dark`
    alias ls='gls --color'
else
    eval `dircolors ~/.dotfiles/dircolors.solarized-dark`
    alias ls='ls --color'
fi

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

bindkey '^R' history-incremental-search-backward

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

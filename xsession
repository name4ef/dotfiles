#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# Fix problems with JDK versions and other broken programs assuming a 
# reparenting window manager for instance
wmname LG3D
#export AWT_TOOLKIT=MToolkit

# Fix blank java window (android studio)
export _JAVA_AWT_WM_NONREPARENTING=1

[[ -x `which unclutter` ]] && unclutter -idle 2 -grab -root &
[[ -x `which xbindkeys` ]] && xbindkeys
[[ -x `which dwmstatus` ]] && dwmstatus &
$HOME/.xsession.setxkbmap
xsetroot -solid '#000000'

# Start the window manager:
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session /usr/bin/dwm
else
  exec /usr/bin/dwm
fi


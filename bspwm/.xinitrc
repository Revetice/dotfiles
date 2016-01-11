if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb merge ~/.Xdefaults &

sxhkd &
urxvt &
feh --bg-scale ~/.wallpaper.jpg &
exec bspwm -c /home/yilin/.config/bspwm/bspwmrc -f 100

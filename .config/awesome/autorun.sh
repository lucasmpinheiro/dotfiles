#!/usr/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

autorandr -l mobile && autorandr -c
nitrogen --restore
eval $(ssh-agent)
run picom -b
run nm-applet
run xfce4-clipman
run xfce4-power-manager
run blueman-applet
run slack
# run mailspring


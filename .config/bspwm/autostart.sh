#!/bin/bash

# Ensure sxhkd uses sh (faster).
export SXHKD_SHELL=sh

# Autostart applications.
sxhkd &

$HOME/.config/polybar/launch.sh

eval $(ssh-agent) &
lxsession &
compton -b &
setxkbmap -layout br,us &
# light-locker --lock-on-suspend &
# redshift-gtk &
# wicd-client --tray &
# run pamac-tray &
# run xfce4-clipman &
slack &
#thunderbird &
nitrogen --restore &


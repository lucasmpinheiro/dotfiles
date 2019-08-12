#!/bin/bash

# Autostart applications.

sxhkd &

$HOME/.config/polybar/launch.sh

eval $(ssh-agent) &
lxsession &
compton &
setxkbmap -layout br,us &
light-locker --lock-on-suspend &
nitrogen --restore &
redshift-gtk &
run nm-applet &
run pamac-tray &
run xfce4-clipman &
run com.slack.Slack &
run thunderbird &


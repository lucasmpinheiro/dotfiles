#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar top &

# my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
# if [[ $my_laptop_external_monitor = *connected* ]]; then
#     polybar top_external &
# fi

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mainbar-herbstluftwm &

# my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
# if [[ $my_laptop_external_monitor = *connected* ]]; then
#     polybar mainbar-herbstluftwm-extra &
# fi

echo "Polybar launched..."

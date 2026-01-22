#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.drawing=off \
                         label.padding_left=10 \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

sketchybar --add item battery_icon right \
           --set battery_icon background.color=$YELLOW \
                              background.padding_right=-10 \
                              label.drawing=off \
                              icon.padding_left=2 \
                              icon.color=$PRIMARY_ITEM_ICON_COLOR


#!/bin/bash

sketchybar --add item calendar right \
           --set calendar update_freq=10 \
                         icon.drawing=off \
                         label.padding_left=10 \
                         script="$PLUGIN_DIR/clock.sh" \
                         click_script="$PLUGIN_DIR/calendar_click.sh" \
                         background.padding_left=10

sketchybar --add item calendar_icon right \
           --set calendar_icon background.color=$BLUE \
                              background.padding_right=-10 \
                              label.drawing=off \
                              icon.padding_left=2 \
                              icon.color=$PRIMARY_ITEM_ICON_COLOR \
                              icon=􀧞 \
                              click_script="$PLUGIN_DIR/calendar_click.sh"


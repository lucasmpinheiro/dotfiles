#!/bin/sh

sketchybar --add item space_separator left \
           --set space_separator icon="􀆊" \
                                 icon.padding_left=4 \
                                 icon.padding_right=4 \
                                 label.padding_right=0 \
                                 padding_right=0 \
                                 label.drawing=off

sketchybar  --add item front_app left \
            --set front_app \
                  icon.font="sketchybar-app-font:Regular:16.0" \
                  label.padding_left=0 \
                  icon.padding_left=2 \
                  padding_left=0 \
                  script="$PLUGIN_DIR/front_app.sh" \
            --subscribe front_app front_app_switched

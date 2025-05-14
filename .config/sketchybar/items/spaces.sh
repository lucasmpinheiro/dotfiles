#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar  --add item space.$sid left \
                --subscribe space.$sid aerospace_workspace_change \
                --set space.$sid \
                      background.drawing=off \
                      background.color=$ACCENT_COLOR \
                      padding_left=0 \
                      padding_right=0 \
	                    label.padding_left=0 \
	                    label.padding_right=0 \
                      label.font="sketchybar-app-font:Regular:16.0" \
	                    icon.padding_left=6 \
	                    icon.padding_right=6 \
                      icon="$sid" \
                      click_script="aerospace workspace $sid" \
                      script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

sketchybar --add item space_separator left \
           --set space_separator icon="􀆊" \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4 \
                                 label.drawing=off \
                                 background.drawing=off
#                                 script="$PLUGIN_DIR/space_windows.sh" \
#           --subscribe space_separator space_windows_change


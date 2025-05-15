#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar  --add item space.$sid left \
                --subscribe space.$sid aerospace_workspace_change \
                --set space.$sid \
                      background.color=$SECONDARY_ITEM_BG_COLOR \
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


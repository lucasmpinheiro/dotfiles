#!/bin/bash

sketchybar --add event aerospace_workspace_change \
           --add event aerospace_window_focus_change

for sid in $(aerospace list-workspaces --all); do
    # Add the workspace number item
    sketchybar  --add item space.$sid left \
                --subscribe space.$sid aerospace_workspace_change \
                --set space.$sid \
                      background.corner_radius=0 \
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

    # Add the workspace apps item
    sketchybar  --add item space.$sid.apps left \
                --subscribe space.$sid.apps aerospace_window_focus_change \
                --set space.$sid.apps \
                      background.corner_radius=0 \
                      padding_left=0 \
                      padding_right=4 \
                      label.padding_left=0 \
                      label.padding_right=4 \
                      label.font="sketchybar-app-font:Regular:12.0" \
                      icon.drawing=off \
                      script="$CONFIG_DIR/plugins/workspace_apps.sh $sid"
done


#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=$PRIMARY_ITEM_BG_COLOR \
                           icon.color=$PRIMARY_ITEM_ICON_COLOR \
                           label.color=$PRIMARY_ITEM_LABEL_COLOR
else
    sketchybar --set $NAME background.color=$SECONDARY_ITEM_BG_COLOR \
                           icon.color=$SECONDARY_ITEM_ICON_COLOR \
                           label.color=$SECONDARY_ITEM_LABEL_COLOR
fi


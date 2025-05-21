#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.color=$RED \
                           label.color=$PRIMARY_ITEM_LABEL_COLOR
else
    sketchybar --set $NAME icon.color=$SECONDARY_ITEM_ICON_COLOR \
                           label.color=$SECONDARY_ITEM_LABEL_COLOR
fi


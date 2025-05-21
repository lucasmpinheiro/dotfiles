#!/bin/bash

WORKSPACE="$1"

# Get apps from aerospace output format: "<window_id> | <app_name> | <window_title>"
APPS=$(aerospace list-windows --workspace "$WORKSPACE" | awk -F '\\|' '{gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}' | sort -u)

# Initialize an empty string for icons
ICONS=""

# Process each app and get its icon
while IFS= read -r APP; do
  if [ ! -z "$APP" ]; then
    ICON="$($CONFIG_DIR/plugins/icon_map.sh "$APP")"

    if [ ! -z "$ICON" ]; then
      if [ -z "$ICONS" ]; then
        ICONS="$ICON"
      else
        ICONS="$ICONS $ICON"
      fi
    fi
  fi
done <<< "$APPS"

echo "$ICONS"

# Update the label with the icons
if [ ! -z "$ICONS" ]; then
  sketchybar --set space.$WORKSPACE.apps label="$ICONS" \
                                         label.drawing=on
else
  sketchybar --set space.$WORKSPACE.apps label="" \
                                         label.drawing=off
fi 
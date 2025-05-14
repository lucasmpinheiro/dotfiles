#!/bin/sh

export WHITE=0xffffffff

# THEME COLORS
# These should not be used directly. They are to be referenced by the bar colors instead.
export BASE_COLOR=0xff24273a
export OVERLAY_COLOR=0xff6e738d
export TEXT_COLOR=0xffcdd6f4
export ACCENT_COLOR=0xff8aadf4

# BAR COLORS 
# Variables actually used by bar components.
export BAR_COLOR=0x00000000
export PRIMARY_ITEM_BG_COLOR=$ACCENT_COLOR
export PRIMARY_ITEM_LABEL_COLOR=$BASE_COLOR
export PRIMARY_ITEM_ICON_COLOR=$BASE_COLOR
export SECONDARY_ITEM_BG_COLOR=$OVERLAY_COLOR
export SECONDARY_ITEM_LABEL_COLOR=$BASE_COLOR
export SECONDARY_ITEM_ICON_COLOR=$TEXT_COLOR


#!/bin/sh

export WHITE=0xffffffff
export MAUVE=0xffc6a0f6
export RED=0xffed8796
export PEACH=0xfff5a97f
export YELLOW=0xffeed49f
export GREEN=0xffa6da95
export TEAL=0xff8bd5ca
export BLUE=0xff8aadf4
export LAVENDER=0xffb7bdf8

# THEME COLORS
# These should not be used directly. They are to be referenced by the bar colors instead.
export BASE_COLOR=0xff24273a
export OVERLAY_COLOR=0xff6e738d
export SURFACE_COLOR=0xff494d64
export TEXT_COLOR=0xffcdd6f4
export ACCENT_COLOR=0xff8aadf4

# BAR COLORS
# Variables actually used by bar components.
export BAR_COLOR=0xaa24273a
export PRIMARY_ITEM_BG_COLOR=$SURFACE_COLOR
export PRIMARY_ITEM_LABEL_COLOR=$TEXT_COLOR
export PRIMARY_ITEM_ICON_COLOR=$BASE_COLOR
export SECONDARY_ITEM_BG_COLOR=$OVERLAY_COLOR
export SECONDARY_ITEM_LABEL_COLOR=$BASE_COLOR
export SECONDARY_ITEM_ICON_COLOR=$TEXT_COLOR

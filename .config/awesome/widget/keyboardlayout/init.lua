local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local theme = require("beautiful")

local dpi = theme.xresources.apply_dpi

local create_widget = function(bg_color)
  bg_color = bg_color or theme.bg_focus

  return wibox.widget {
    {
      awful.widget.keyboardlayout(),
      bg = bg_color,
      shape = gears.shape.rounded_rect,
      widget = wibox.container.background,
    },
    margins = dpi(4),
    widget = wibox.container.margin,
  }
end

return create_widget

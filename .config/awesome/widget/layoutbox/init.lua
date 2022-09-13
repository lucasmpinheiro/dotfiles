local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local dpi = require("beautiful.xresources").apply_dpi

-- Create an imagebox widget which will contain an icon indicating which layout we're using.
local create_layout_box = function(s)
	local layout_box_widget = awful.widget.layoutbox(s)
	layout_box_widget:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	return wibox.container.margin(layout_box_widget, dpi(0), dpi(6), dpi(6), dpi(6))
end

return create_layout_box

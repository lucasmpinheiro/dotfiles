local wibox = require("wibox")
local beautiful = require("beautiful")

local theme = beautiful.get()

local systray_widget = wibox.widget.systray()
systray_widget:set_base_size(theme.systray_icon_size)

local container = wibox.container.margin(
	systray_widget,
	theme.systray_margin_horizontal,
	theme.systray_margin_horizontal,
	theme.systray_margin_vertical,
	theme.systray_margin_vertical
)

return container

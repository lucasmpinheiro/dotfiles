local wibox = require("wibox")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local systray_widget = wibox.widget.systray()
systray_widget:set_base_size(dpi(24))

return systray_widget

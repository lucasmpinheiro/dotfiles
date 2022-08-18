local wibox = require("wibox")
local lain = require("lain")
local theme = require("theme")

local clock_widget = wibox.widget.textclock()

-- Attach a calendar notification to the clock widget.
lain.widget.cal {
    attach_to = { clock_widget },
    week_start = 1,
    followtag = true,
    notification_preset = {
        font = theme.font,
        fg = theme.fg_normal,
        bg = theme.bg_normal,
    },
}

return clock_widget
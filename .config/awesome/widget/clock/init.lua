local wibox = require("wibox")
local lain = require("lain")
local theme = require("theme")

-- local clock_widget = wibox.widget.textclock("%H:%M")

local clock_widget = wibox.widget(
    {
      {format = "%H:%M", widget = wibox.widget.textclock},
      layout = wibox.layout.flex.horizontal,
    }
)

-- Attach a calendar notification to the clock widget.
lain.widget.cal {
  attach_to = {clock_widget},
  week_start = 1,
  followtag = true,
  notification_preset = {
    font = theme.font,
    fg = theme.fg_normal,
    bg = theme.bg_normal,
  },
}

return clock_widget

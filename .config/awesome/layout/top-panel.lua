local awful = require("awful")
local wibox = require("wibox")

local beautiful = require("beautiful")
local theme = beautiful.get()

-- Load widgets.
local battery_widget = require("widget.battery")
local volume_widget = require("widget.volume")
local keyboardlayout_widget = require("widget.keyboardlayout")
local clock_widget = require("widget.clock")
local systray_widget = require("widget.systray")
local create_taglist = require("widget.taglist")
local create_tasklist = require("widget.tasklist")
local create_layout_box = require("widget.layoutbox")
local power_menu_widget = require("widget.powermenu")

local create_top_panel = function(s)
  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  s.mylayoutbox = create_layout_box(s)
  s.mytaglist = create_taglist(s)
  s.mytasklist = create_tasklist(s)

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen = s,
    height = theme.wibar_height,
  }

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    {
      -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    {
      -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      systray_widget,
      keyboardlayout_widget,
      volume_widget,
      battery_widget,
      clock_widget,
      s.mylayoutbox,
      power_menu_widget,
    },
  }
end

return create_top_panel

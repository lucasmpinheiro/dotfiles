local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local widget_template = {
  {
    {
      id = "clienticon",
      widget = awful.widget.clienticon,
    },
    margins = dpi(4),
    widget = wibox.container.margin,
  },
  id = "background_role",
  widget = wibox.container.background,
  create_callback = function(self, c, index, objects)
    self:get_children_by_id("clienticon")[1].client = c
  end,
}

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal("request::activate", "tasklist", { raise = true })
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list { theme = { width = 250 } }
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)

local create_tasklist = function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout = {
      spacing = dpi(2),
      layout = wibox.layout.fixed.horizontal,
    },
    widget_template = widget_template,
  }
end

return create_tasklist

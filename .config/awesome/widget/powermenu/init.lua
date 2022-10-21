local awful = require("awful")

local icons = require("theme.icons")
local list_item_widget = require("widget.generic.list-item")

-- Power menu widget.
local widget = list_item_widget(icons.power_off, "")

widget:buttons(awful.util.table.join(awful.button({}, 1, function()
  _G.exit_screen_show()
end)))

return widget

local lain = require("lain")
local awful = require("awful")

local icons = require("theme.icons")
local list_item_widget = require("widget.generic.list-item")

local os = os

local not_available_text = "NA"

-- Volume widget.
local wrapper = lain.widget.pulse({
	settings = function()
		local vlevel = tonumber(volume_now.left) or not_available_text

		local volicon = icons.volume_high
		if volume_now.muted == "yes" or vlevel == nil then
			volicon = icons.volume_muted
		elseif vlevel == 0 then
			volicon = icons.volume_off
		elseif vlevel < 50 then
			volicon = icons.volume_low
		end

		widget:set_icon(volicon)
		widget:set_text(("%-4s"):format(vlevel .. "%"))
	end,
	widget = list_item_widget(icons.volume_off, not_available_text),
})

wrapper.widget:buttons(awful.util.table.join(
	awful.button({}, 1, function() -- left click
		awful.spawn("pavucontrol")
	end),
	awful.button({}, 3, function() -- right click
		os.execute(string.format("pactl set-sink-mute %s toggle", wrapper.device))
		wrapper.update()
	end),
	awful.button({}, 4, function() -- scroll up
		os.execute(string.format("pactl set-sink-volume %s +5%%", wrapper.device))
		wrapper.update()
	end),
	awful.button({}, 5, function() -- scroll down
		os.execute(string.format("pactl set-sink-volume %s -5%%", wrapper.device))
		wrapper.update()
	end)
))

return wrapper.widget

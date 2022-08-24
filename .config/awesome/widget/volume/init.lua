local lain = require("lain")
local awful = require("awful")

local os = os

-- Volume widget.
local volume_widget = lain.widget.pulse({
	settings = function()
		local volicon = " "
		local vlevel = tonumber(volume_now.left)

		if volume_now.muted == "yes" or vlevel == nil then
			volicon = "ﱝ "
		elseif vlevel == 0 then
			volicon = " "
		elseif vlevel < 50 then
			volicon = " "
		end

		vlevel = vlevel or "NA"

		widget:set_markup(" " .. volicon .. vlevel .. "% ")
	end,
})

volume_widget.widget:buttons(awful.util.table.join(
	awful.button({}, 1, function() -- left click
		awful.spawn("pavucontrol")
	end),
	awful.button({}, 3, function() -- right click
		os.execute(string.format("pactl set-sink-volume %s toggle", volume_widget.device))
		volume_widget.update()
	end),
	awful.button({}, 4, function() -- scroll up
		os.execute(string.format("pactl set-sink-volume %s +5%%", volume_widget.device))
		volume_widget.update()
	end),
	awful.button({}, 5, function() -- scroll down
		os.execute(string.format("pactl set-sink-volume %s -5%%", volume_widget.device))
		volume_widget.update()
	end)
))

return volume_widget

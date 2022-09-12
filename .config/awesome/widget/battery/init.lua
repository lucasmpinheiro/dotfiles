local lain = require("lain")

local icons = require("theme.icons")
local list_item_widget = require("widget.generic.list-item")

-- Battery widget.
local wrapper = lain.widget.bat({
	timeout = 5,
	settings = function()
		if bat_now.status == nil or bat_now.status == "N/A" then
			widget:set_content(nil, "")
			return
		end

		local blevel = tonumber(bat_now.perc)

		local baticon = icons.battery_full
		if bat_now.ac_status == 1 then
			baticon = icons.battery_charging
		elseif blevel <= 5 then
			baticon = icons.battery_empty
		elseif blevel <= 25 then
			baticon = icons.battery_low
		elseif blevel <= 50 then
			baticon = icons.battery_medium
		elseif blevel <= 75 then
			baticon = icons.battery_high
		end

		-- widget:set_markup(" " .. baticon .. bat_now.perc .. "% ")
		widget:set_content(baticon, ("%-4s"):format(bat_now.perc .. "%"))
	end,
	widget = list_item_widget(nil, ""),
})

return wrapper.widget

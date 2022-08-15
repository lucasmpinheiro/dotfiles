local lain = require("lain")

-- Battery widget.
local battery_widget = lain.widget.bat {
  timeout = 5,
  settings = function()
      if bat_now.status == nil or bat_now.status == "N/A" then
          widget:set_markup()
          return
      end

      local baticon = "  "
      local blevel = tonumber(bat_now.perc)

      if bat_now.ac_status == 1 then
          baticon = " "
      elseif blevel <= 5 then
          baticon = "  "
      elseif blevel <= 25 then
          baticon = "  "
      elseif blevel <=50 then
          baticon = "  "
      elseif blevel <= 75 then
          baticon = "  "
      end

      widget:set_markup(" " .. baticon .. bat_now.perc .. "% ")
  end
}

return battery_widget

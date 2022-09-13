local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local tasklist_buttons =
    gears.table.join(
        awful.button(
            {},
            1,
            function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal("request::activate", "tasklist", {raise = true})
                end
            end
        ),
        awful.button(
            {},
            3,
            function()
                awful.menu.client_list({theme = {width = 250}})
            end
        ),
        awful.button(
            {},
            4,
            function()
                awful.client.focus.byidx(1)
            end
        ),
        awful.button(
            {},
            5,
            function()
                awful.client.focus.byidx(-1)
            end
        )
    )

local create_tasklist = function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		layout = {
			spacing = dpi(10),
			layout = wibox.layout.flex.vertical,
		},
		widget_template = {
			id = "background_role",
			widget = wibox.container.background,
			{
				widget = wibox.container.margin,
				margins = dpi(8),
				{
					layout = wibox.layout.fixed.vertical,
					{
						widget = wibox.container.margin,
						bottom = dpi(5),
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
					},
					--{
					--	widget = wibox.widget.textbox,
					--	id = "text_role",
					--},
				},
			},
		},
	})
end

return create_tasklist

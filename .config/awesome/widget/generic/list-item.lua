local wibox = require("wibox")

local factory = function(icon, text)
	return wibox.widget({
		{
			{
				{
					{
						id = "icon",
						image = icon,
						resize = true,
						widget = wibox.widget.imagebox,
					},
					height = 14,
					widget = wibox.container.constraint,
				},
				valign = "center",
				widget = wibox.container.place,
			},
			{
				{
					id = "txt",
					text = text,
					widget = wibox.widget.textbox,
				},
				left = 2,
				widget = wibox.container.margin,
			},
			layout = wibox.layout.align.horizontal,
		},
		widget = wibox.container.background,
		set_icon = function(self, new_icon)
			self:get_children_by_id("icon")[1]:set_image(new_icon)
		end,
		set_text = function(self, new_text)
			self:get_children_by_id("txt")[1]:set_text(new_text)
		end,
	})
end

return factory

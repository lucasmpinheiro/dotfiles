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
				left = 4,
				widget = wibox.container.margin,
			},
			layout = wibox.layout.align.horizontal,
		},
		widget = wibox.container.background,
		set_icon = function(self, icon)
			self:get_children_by_id("icon")[1]:set_image(icon)
		end,
		set_text = function(self, text)
			self:get_children_by_id("txt")[1]:set_text(text)
		end,
		set_content = function(self, icon, text)
			self:set_icon(icon)
			self:set_text(text)
		end,
	})
end

return factory

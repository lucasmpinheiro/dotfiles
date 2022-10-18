local wibox = require("wibox")
local gears = require("gears")
local theme = require("beautiful")

local dpi = theme.xresources.apply_dpi

local factory = function(icon, text, bg_color)
  bg_color = bg_color or theme.bg_focus

  return wibox.widget {
    {
      {
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
        left = dpi(8),
        right = dpi(8),
        layout = wibox.container.margin,
      },
      bg = bg_color,
      shape = gears.shape.rounded_rect,
      widget = wibox.container.background,
    },
    margins = dpi(4),
    widget = wibox.container.margin,
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
  }
end

return factory

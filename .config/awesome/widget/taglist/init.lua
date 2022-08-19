local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local modkey = require("configuration.keys.mod").modKey

local taglist_buttons =
    gears.table.join(
        awful.button(
            {},
            1,
            function(t)
                t:view_only()
            end
        ),
        awful.button(
            {modkey},
            1,
            function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end
        ),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button(
            {modkey},
            3,
            function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end
        ),
        awful.button(
            {},
            4,
            function(t)
                awful.tag.viewnext(t.screen)
            end
        ),
        awful.button(
            {},
            5,
            function(t)
                awful.tag.viewprev(t.screen)
            end
        )
    )

local create_taglist = function(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = {
            id = 'background_role',
            widget = wibox.container.background,
            {
                widget = wibox.container.margin,
                margins = dpi(8),
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox
                }
            }
        },
        -- create_callback = function(self, c3, index, objects)
        --     self:get_children_by_id('text_role')[1].markup =
        -- end,
    }
end

return create_taglist

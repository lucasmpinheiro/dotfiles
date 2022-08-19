local gears = require("gears")
local awful = require("awful")
local cyclefocus = require("cyclefocus")

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local client_keys =
    gears.table.join(
        awful.key(
            {modkey},
            "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}
        ),
        awful.key(
            {modkey},
            "w",
            function(c)
                c:kill()
            end,
            {description = "close", group = "client"}
        ),
        awful.key(
            {modkey, "Control"},
            "space",
            awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}
        ),
        awful.key(
            {modkey, "Control"},
            "Return",
            function(c)
                c:swap(awful.client.getmaster())
            end,
            {description = "move to master", group = "client"}
        ),
        awful.key(
            {modkey},
            "o",
            function(c)
                c:move_to_screen()
            end,
            {description = "move to screen", group = "client"}
        ),
        awful.key(
            {modkey},
            "t",
            function(c)
                c.ontop = not c.ontop
            end,
            {description = "toggle keep on top", group = "client"}
        ),
        awful.key(
            {modkey},
            "n",
            function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end,
            {description = "minimize", group = "client"}
        ),
        awful.key(
            {modkey},
            "m",
            function(c)
                c.maximized = not c.maximized
                c:raise()
            end,
            {description = "(un)maximize", group = "client"}
        ),
        awful.key(
            {modkey, "Control"},
            "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end,
            {description = "(un)maximize vertically", group = "client"}
        ),
        awful.key(
            {modkey, "Shift"},
            "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end,
            {description = "(un)maximize horizontally", group = "client"}
        ),
        -- Alt-Tab: cycle through clients on the same screen.
        -- This must be a clientkeys mapping to have source_c available in the callback.
        cyclefocus.key({altkey}, "Tab", {
            -- cycle_filters as a function callback:
            -- cycle_filters = { function (c, source_c) return c.screen == source_c.screen end },

            -- cycle_filters from the default filters:
            cycle_filters = { cyclefocus.filters.same_screen, cyclefocus.filters.common_tag },
            keys = {'Tab', 'ISO_Left_Tab'}  -- default, could be left out
        })
    )

return client_keys

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local os = os

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout libraries.
local wibox = require("wibox")
local lain = require("lain")
-- Theme handling library
local beautiful = require("beautiful")
-- Display management library.
local xrandr = require("xrandr")
-- local menubar = require("menubar")
local freedesktop = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load theme.
beautiful.init(require("theme"))
local theme = beautiful.get()

-- Load modules.
require("module.notifications")

-- Load widgets.
local battery_widget = require("widget.battery")
local volume_widget = require("widget.volume")
local keyboardlayout_widget = require("widget.keyboardlayout")
local clock_widget = require("widget.clock")
local systray_widget = require("widget.systray")
local create_taglist = require("widget.taglist")
local create_tasklist = require("widget.tasklist")
local create_layout_box = require("widget.layoutbox")

-- Load apps config.
local apps = require("configuration.apps")
awful.util.shell = "bash"

-- Load keys config.
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

-- Load layouts.
awful.layout.layouts = require('configuration.layouts')

-- Load other configs.
local tags = require("configuration.tags")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

awful.screen.connect_for_each_screen(
    function(s)
        -- Displays and wallpaper.
        awful.spawn.with_shell("autorandr --change")
        awful.spawn.with_shell("nitrogen --restore")

        -- Wallpaper
        -- set_wallpaper(s)

        -- Each screen has its own tag table.
        for i, tag in pairs(tags) do
            awful.tag.add(tag.name, {
                layout = tag.layout,
                gap_single_client = false,
                gap = 4,
                screen = s,
                selected = i == 1
            })
        end

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        s.mylayoutbox = create_layout_box(s)
        s.mytaglist = create_taglist(s)
        s.mytasklist = create_tasklist(s)

        -- Create the wibox
        s.mywibox = awful.wibar({
            position = "top",
            screen = s,
            height = theme.wibar_height,
        })

        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox
            },
            s.mytasklist, -- Middle widget
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                systray_widget,
                keyboardlayout_widget,
                volume_widget,
                battery_widget,
                clock_widget,
                s.mylayoutbox
            }
        }
    end
)
-- }}}

-- {{{ Mouse bindings
root.buttons(
    gears.table.join(
        awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    )
)
-- }}}

-- {{{ Key bindings
local globalkeys = require("configuration.keys.global")

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry"
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {floating = true}
    },
    -- Do not add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = {"normal", "dialog"}
        },
        properties = {titlebars_enabled = false}
    },

    -- Map programs to certain screens and tags.
    {
        rule = { class = "Firefox" },
        properties = { screen = 1, tag = tags[1].name }
    },
    {
        rule = { class = "Slack" },
        properties = { screen = 1, tag = tags[3].name }
    },
    {
        rule = { class = "Zoom" },
        properties = { screen = 1, tag = tags[4].name }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- if not awesome.startup then awful.client.setslave(c) end

        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end
)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
    "request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons =
            gears.table.join(
            awful.button(
                {},
                1,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                {},
                3,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.resize(c)
                end
            )
        )

        awful.titlebar(c):setup {
            {
                -- Left
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons,
                layout = wibox.layout.fixed.horizontal
            },
            {
                -- Middle
                {
                    -- Title
                    align = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            {
                -- Right
                awful.titlebar.widget.floatingbutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.stickybutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal()
            },
            layout = wibox.layout.align.horizontal
        }
    end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
    "mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end
)

client.connect_signal(
    "focus",
    function(c)
        c.border_color = beautiful.border_focus
    end
)
client.connect_signal(
    "unfocus",
    function(c)
        c.border_color = beautiful.border_normal
    end
)
-- }}}

-- Autorun programs.
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

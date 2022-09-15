local awful = require("awful")

local create_top_panel = require("layout.top-panel")

awful.screen.connect_for_each_screen(create_top_panel)

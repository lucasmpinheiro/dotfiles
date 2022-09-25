-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
-- theme.wallpaper = themes_path .. "zenburn/zenburn-background.png"
-- }}}

-- {{{ Styles
theme.font = "FiraCode Nerd Font Mono 10"
-- theme.font_mono = "UbuntuMono Nerd Font 12"

-- {{{ Colors
theme.fg_normal = "#dfdfdf"
theme.fg_focus = "#dfdfdf"
theme.fg_accent = "#66bb6a"
theme.fg_inactive = "#888888"
theme.fg_urgent = theme.fg_focus
theme.bg_normal = "#212121"
theme.bg_focus = "#2c2c2c"
theme.bg_accent = "#3a4e3b"
theme.bg_urgent = theme.bg_accent
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders and gaps
theme.useless_gap = dpi(5)
theme.gap_single_client = false
theme.border_width = dpi(2)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_accent
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Systray
theme.systray_icon_spacing = 5
theme.systray_icon_size = 15
theme.systray_margin_vertical = dpi(6)
theme.systray_margin_horizontal = dpi(14)
-- }}}

-- Wibar
theme.wibar_height = dpi(30)

-- {{{ Titlebars
-- theme.titlebar_bg_focus = "#3F3F3F"
-- theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- {{{ Taglist and tasklist
local wibar_bg_focus = {
	type = "linear",
	from = { 0, 0 },
	to = { 0, theme.wibar_height },
	stops = {
		{ 0, theme.bg_focus },
		{ 0.9, theme.bg_focus },
		{ 0.9, theme.fg_accent },
		{ 1, theme.fg_accent },
	},
}

theme.taglist_bg_focus = wibar_bg_focus
theme.taglist_fg_empty = theme.fg_inactive
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_fg_focus = theme.fg_accent

theme.tasklist_bg_focus = wibar_bg_focus
theme.tasklist_fg_normal = theme.fg_inactive
theme.tasklist_fg_focus = theme.fg_focus
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(32)
theme.menu_width = dpi(200)
-- }}}

-- {{{ Misc
theme.awesome_icon = themes_path .. "zenburn/awesome-icon.png"
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating = themes_path .. "zenburn/layouts/floating.png"
theme.layout_cornernw = themes_path .. "zenburn/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "zenburn/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "zenburn/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "zenburn/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = themes_path .. "zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active = themes_path .. "zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active = themes_path .. "zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = themes_path .. "zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

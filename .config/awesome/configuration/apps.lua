local os = os

local awful = require("awful")
local filesystem = require("gears.filesystem")

-- Run some commmands when a screen (dis)connects.
awful.screen.connect_for_each_screen(function(s)
  -- Update displays and wallpapers.
  awful.spawn.with_shell("autorandr --change")
  awful.spawn.with_shell("nitrogen --restore")
end)

return {
  -- List of apps to start by default on some actions.
  default = {
    terminal = "kitty",
    editor = os.getenv("EDITOR") or "code",
    run_app = "rofi -modi drun,window,run,ssh -show drun",
    lock = "slock",
    browser = "firefox",
    quake = "kitty --title QuakeTerminal",
  },
}

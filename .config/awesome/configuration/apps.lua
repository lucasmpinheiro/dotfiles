local os = os

local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions.
  default = {
    terminal = "kitty",
    editor = os.getenv("EDITOR") or "vim",
    run_app = "rofi -modi drun,window,run,ssh -show drun",
    lock = 'slock',
    quake = "kitty --title QuakeTerminal"
  }
}

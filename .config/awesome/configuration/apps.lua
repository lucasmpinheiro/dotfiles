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
  },
  -- List of apps to start once on start-up.
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)' -- credential manager
  }
}

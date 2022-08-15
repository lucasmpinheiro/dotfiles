local naughty = require('naughty')
local beautiful = require('beautiful')
local gears = require('gears')
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi
local theme = beautiful.get()

-- Naughty presets
naughty.config.padding = dpi(8)
naughty.config.spacing = dpi(8)

naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = 1
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.margin = dpi(8)
naughty.config.defaults.ontop = true
-- naughty.config.defaults.title = 'System Notification'
naughty.config.defaults.font = beautiful.font
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = dpi(64)
-- naughty.config.defaults.shape = gears.shape.rounded_rect
naughty.config.defaults.border_width = theme.border_width
naughty.config.defaults.border_color = theme.border_focus
naughty.config.defaults.hover_timeout = nil

-- Error handling.
-- Check if awesome encountered an error during startup and fell back to
-- another config (this code will only ever execute for the fallback config).
if _G.awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = 'Oops, there were errors during startup!',
      text = _G.awesome.startup_errors
    }
  )
end

-- Handle runtime errors after startup
do
  local in_error = false
  _G.awesome.connect_signal(
    'debug::error',
    function(err)
      -- Make sure we don't go into an endless error loop.
      if in_error then
        return
      end
      in_error = true

      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = 'Oops, an error happened!',
          text = tostring(err)
        }
      )
      in_error = false
    end
  )
end

function log_this(title, txt)
  naughty.notify(
    {
      title = 'log: ' .. title,
      text = txt
    }
  )
end

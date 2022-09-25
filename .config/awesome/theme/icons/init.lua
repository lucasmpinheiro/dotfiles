local dir = os.getenv("HOME") .. "/.config/awesome/theme/icons"

return {
  -- Volume.
  volume_high = dir .. "/volume/volume-high-solid.svg",
  volume_low = dir .. "/volume/volume-low-solid.svg",
  volume_off = dir .. "/volume/volume-off-solid.svg",
  volume_muted = dir .. "/volume/volume-xmark-solid.svg",

  -- Battery.
  battery_empty = dir .. "/battery/battery-empty-solid.svg",
  battery_low = dir .. "/battery/battery-quarter-solid.svg",
  battery_medium = dir .. "/battery/battery-half-solid.svg",
  battery_high = dir .. "/battery/battery-three-quarters-solid.svg",
  battery_full = dir .. "/battery/battery-full-solid.svg",
  battery_charging = dir .. "/battery/plug-circle-bolt-solid.svg",

  -- Power.
  power_off = dir .. "/power/power-off-solid.svg",
  reboot = dir .. "/power/rotate-right-solid.svg",
  suspend = dir .. "/power/moon-solid.svg",
  logout = dir .. "/power/right-from-bracket-solid.svg",
  lock = dir .. "/power/lock-solid.svg",
}

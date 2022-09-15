local awful = require("awful")

local tags = {
  {
    name = "1",
    layout = awful.layout.suit.max,
  },
  {
    name = "2",
    layout = awful.layout.suit.tile,
  },
  {
    name = "3",
    layout = awful.layout.suit.tile,
  },
  {
    name = "4",
    layout = awful.layout.suit.tile,
  },
  {
    name = "5",
    layout = awful.layout.suit.tile,
  },
}

awful.screen.connect_for_each_screen(function(s)
  -- Each screen has its own tag table.
  for i, tag in pairs(tags) do
    awful.tag.add(tag.name, {
      layout = tag.layout,
      gap_single_client = false,
      gap = 4,
      screen = s,
      selected = i == 1,
    })
  end
end)

return tags

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

return tags

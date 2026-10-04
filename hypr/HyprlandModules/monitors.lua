
-- My laptop's monitor
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60.00100",
    position = "",
    scale    = "1.33",
})

-- My MSI primary screen in home office
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@60.00000",
    position = "0x0",
    scale = "auto"
})

--
--
--
-- This is where I might implement a 90 deg code screen if I get a second monitor
--
--
--
--

-- Good default to fall back to with new monitors
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto"
})


-- My laptop's monitor
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60.00100",
    position = "0x0",
    scale    = "auto",
})

-- Good default to fall back to with new monitors
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1 })

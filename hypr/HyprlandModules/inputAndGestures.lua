hl.config({
    input = {
        kb_layout  = "us,se",
        kb_variant = "altgr-intl",
        kb_model   = "pc86",
        kb_options = "grp:alt_caps_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
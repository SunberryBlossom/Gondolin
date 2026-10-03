-- mouse cursor modifications
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")

-- enabling hyprqt6engine as theme provider
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

-- remove grainyness from Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.config({
  xwayland = {
    enabled = true,
    force_zero_scaling = true
  }
})
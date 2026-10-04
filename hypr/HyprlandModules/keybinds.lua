-- when adding new, more complicated binds, refer to https://wiki.hypr.land/Configuring/Basics/Binds/


-- variables
local terminal        = "kitty"
local fileManager     = "kitty yazi"
local appMenu         = "fuzzel"
local mainMod         = "SUPER"
local mainBrowser     = "librewolf"
local lockScreen      = "hyprlock"
local passwordManager = "proton-pass"
local mailClient = "proton-mail"


-- app hotkeys
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(appMenu))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lockScreen))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(mainBrowser))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(passwordManager))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(mailClient))


-- window management
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("ALT + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()

    hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 20, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -20, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))

end)


-- window navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))


-- workspace navigation
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end


-- kill commands
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })


-- screenshots (print to be able to annotate it, shift+print to just get a direct copy)
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))


-- screen recordings (SUPER + print for screen recording with sound, SUPER + SHIFT + Print for silent recordings)
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('wf-recorder -g "$(slurp)" --audio -f ~/Videos/ScreenRecordings/myRecording.mp4'))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd('wf-recorder -g "$(slurp)" -f ~/Videos/ScreenRecordings/myRecording.mp4'))


-- pick a color using hyprpicker!
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprpicker --autocopy --format=hex --notify "))


-- look at your clipboard history with cliphist through fuzzel
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))
local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local websites = os.getenv("HOME") .. "/.config/hypr/scripts/wofi-websites.py"
local lock = os.getenv("HOME") .. "/.config/hypr/scripts/lock.sh"
local rename_workspace = os.getenv("HOME") .. "/.config/hypr/scripts/rename-workspace.sh"

local left = "l"
local right = "h"
local up = "k"
local down = "j"

-- HACK: Why is this needed?
hl.window_rule({ match = { class = "kitty" }, fullscreen_state="0"})

hl.bind(mainMod .. "+return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+Q", hl.dsp.window.close())
hl.bind(mainMod .. "+SHIFT+Q", hl.dsp.window.kill())
hl.bind(
	mainMod .. "+R",
	hl.dsp.exec_cmd(
		terminal .. " " .. rename_workspace,
		{ float = true, size = { "monitor_w * 0.35", "monitor_h * 0.05" } }
	)
)
hl.bind(mainMod .. "+CTRL+R", hl.dsp.force_renderer_reload())
hl.bind(mainMod .. "+D", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+V", hl.dsp.window.float())
hl.bind(mainMod .. "+E", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. "+W", hl.dsp.exec_cmd(websites))
hl.bind(mainMod .. "+escape", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. "+CTRL+escape", hl.dsp.exec_cmd("loginctl poweroff +0"))
hl.bind(mainMod .. "+CTRL+escape", hl.dsp.exec_cmd("loginctl poweroff +0"))
hl.bind(mainMod .. "+CTRL+SHIFT+escape", hl.dsp.exec_cmd("loginctl reboot"))

hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. "+CTRL+F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. "+P", hl.dsp.window.pin())

hl.bind(mainMod .. "+" .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+" .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+" .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+" .. down, hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. "+SHIFT+" .. left, hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. "+SHIFT+" .. right, hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. "+SHIFT+" .. up, hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. "+SHIFT+" .. down, hl.dsp.window.swap({ direction = "down" }))

-- TODO: Preselect

hl.bind(mainMod .. "+B", hl.dsp.group.toggle())
hl.bind(mainMod .. "+X", hl.dsp.group.prev())
hl.bind(mainMod .. "+C", hl.dsp.group.next())
hl.bind(mainMod .. "+I", hl.dsp.group.move_window({ forward = true }))
hl.bind(mainMod .. "+O", hl.dsp.group.move_window({ forward = false }))
hl.bind(mainMod .. "+CTRL+" .. left, hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. "+CTRL+" .. right, hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. "+CTRL+" .. up, hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. "+CTRL+" .. down, hl.dsp.window.move({ direction = "down", grodown_aware = true }))

hl.bind(mainMod .. "+S", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))
hl.bind(mainMod .. "+M", hl.dsp.focus({ monitor = "+1" }))

for i = 1, 10, 1 do
	hl.bind(mainMod .. "+" .. i % 10, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. "+CTRL+" .. i % 10, hl.dsp.window.move({ workspace = i, follow = false }))
	hl.bind(mainMod .. "+CTRL+SHIFT+" .. i % 10, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

hl.bind(mainMod .. "+mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. "+mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize())

hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))
hl.bind("CTRL+Print", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind("CTRL+SHIFT+Print", hl.dsp.exec_cmd([[grim -g "$(slurp)"]]))

hl.config({
	binds = {
		disable_keybind_grabbing = false,
	},
})

require("magnifier")
require("game-mode")
require("close-all")
require("move-all")

-- TODO: bind to swap workplaces. This should move all windows, preserving position. And swap names.

-- TODO: Switch between caps lock being backspace and control. If possible use the light on it.

-- TODO: smartgaps?



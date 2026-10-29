hl.env("CUDA_VISIBLE_DEVICES", "0")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("WLR_DRM_DEVICES", "/dev/dri/card0")
hl.env("XCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/10_nvidia.json")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "NotwaitaBlack")

hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/libexec/hyprpolkitagent")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/scripts.xdg-desktop-portal-hyprland")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/pipewire.sh")
	hl.exec_cmd("mullvad connect")
	hl.exec_cmd("swayidle -w timeout 300" .. os.getenv("HOME") .. "/.config/hypr/scripts/lock.sh")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/wallpaper.sh")
end)

local path = os.getenv("HOME") .. "/.cache/wal/colors.lua"
local chunk, __err = loadfile(path)
assert(chunk, "Could not load pywal colors: ")

local colors = chunk()

hl.config({
	debug = {
		disable_logs = false,
		gl_debugging = true,
	},
})

hl.config({
	general = {
		allow_tearing = false,
		border_size = 1,
		gaps_in = 5,
		gaps_out = 10,
		layout = "dwindle",
		resize_on_border = false,
		col = {
			active_border = { colors = { colors.color2, colors.color3 }, angle = 45 },
			inactive_border = { colors = { colors.color0, colors.color1 }, angle = 45 },
		},
	},
	dwindle = { preserve_split = true },
})

hl.config({
	group = {
		col = {
			border_active = { colors = { colors.color2, colors.color3 }, angle = 45 },
			border_inactive = { colors = { colors.color0, colors.color1 }, angle = 45 },
		},
		groupbar = {
			text_color = colors.foreground,
			col = {
				active = colors.background,
				inactive = colors.background,
			},
		},
	},
})

hl.config({
	input = {
		follow_mouse = 1,
		kb_layout = "gb",
		kb_options = "caps:backspace",
		mouse_refocus = true,
		numlock_by_default = true,
		repeat_delay = 600,
		repeat_rate = 25,
		sensitivity = 0,
	},
})

hl.config({
	cursor = {
		no_warps = false,
		persistent_warps = false,
		hide_on_key_press = true,
	},
})

hl.config({
	misc = {
		animate_manual_resizes = true,
		disable_hyprland_logo = true,
		disable_hyprland_guiutils_check = true,
		enable_anr_dialog = false,
		middle_click_paste = false,
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("main_curve", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
	leaf = "windows",
	enabled = true,
	bezier = "main_curve",
	speed = 7,
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 7,
	bezier = "default",
	style = "popin 80%",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 10,
	bezier = "default",
})
hl.animation({
	leaf = "borderangle",
	enabled = 1,
	speed = 8,
	bezier = "default",
})
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 7,
	bezier = "default",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 6,
	bezier = "default",
})

hl.config({
	decoration = {
		rounding = 10,
		blur = {
			enabled = false,
			-- size = 6,
			-- passes = 2,
			-- new_optimizations = true,
			-- ignore_opacity = true,
			-- xray = true,
		},
		-- active_opacity = 0.95,
		-- inactive_opacity = 0.9,
		fullscreen_opacity = 1.0,

		-- dim_inactive=true,
		dim_strength = 0.2,

		shadow = {
			enabled = true,
			range = 30,
			render_power = 3,
			color = "0x660000001",
		},
	},
})

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})
hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

require("keybindings")

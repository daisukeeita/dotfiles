local wezterm = require("wezterm")
local config = {}
local act = wezterm.action
local mux = wezterm.mux

config.font = wezterm.font("JetBrains Mono", { weight = "Black", italic = true })
config.font_size = 10.0
config.color_scheme = "Catppuccin Mocha"

config.bold_brightens_ansi_colors = "BrightAndBold"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 800
config.cursor_thickness = 1
config.underline_thickness = 1

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "NONE"
config.window_background_image = "./Pictures/samurai_wallpaper.jpeg"

config.window_background_image_hsb = {
	brightness = 0.3,
	saturation = 1.5,
}

config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.2,
}

config.enable_wayland = false

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	------------------------------------------------------------------------
	---                        SPLIT WINDOW PANES                        ---
	------------------------------------------------------------------------
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "=",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	------------------------------------------------------------------------
	---                        ClOSE CURRENT PANE                        ---
	------------------------------------------------------------------------
	{
		key = "c",
		mods = "SUPER",
		action = act.CloseCurrentPane({ confirm = true }),
	},

	------------------------------------------------------------------------
	---                    CHANGE WINDOW PANE DIRECTION                  ---
	------------------------------------------------------------------------
	{
		key = "LeftArrow",
		mods = "SUPER|CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "SUPER|CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "SUPER|CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "SUPER|CTRL",
		action = act.ActivatePaneDirection("Down"),
	},

	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "🔋 " .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format({
		{ Text = bat .. "   " },
		{ Text = wezterm.nerdfonts.fa_clock_o .. " " .. date },
	}))
end)

return config

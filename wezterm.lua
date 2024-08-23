local wezterm = require("wezterm")
local config = {}
local act = wezterm.action
local mux = wezterm.mux

config.default_prog = { "pwsh.exe", "-l" }

config.font = wezterm.font("JetBrains Mono", { weight = "Black", italic = true })
config.font_size = 12.0
config.color_scheme = "Catppuccin Mocha"

config.bold_brightens_ansi_colors = "BrightAndBold"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 300
config.cursor_thickness = 1
config.underline_thickness = 1

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = true
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "NONE"
config.window_background_opacity = 1
config.win32_system_backdrop = "Mica"

config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.2,
}

config.front_end = "OpenGL"

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
		mods = "CTRL|SHIFT",
		action = act.CloseCurrentPane({ confirm = true }),
	},

	------------------------------------------------------------------------
	---                    CHANGE WINDOW PANE DIRECTION                  ---
	------------------------------------------------------------------------
	{
		key = "LeftArrow",
		mods = "ALT|CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT|CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT|CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT|CTRL",
		action = act.ActivatePaneDirection("Down"),
	},

	{
		key = "f",
		mods = "SHIFT|CTRL",
		action = act.ToggleFullScreen,
	},

	------------------------------------------------------------------------
	---                           OPEN TABS                              ---
	------------------------------------------------------------------------
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	------------------------------------------------------------------------
	---                           CLOSE TABS                             ---
	------------------------------------------------------------------------
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},

	------------------------------------------------------------------------
	---                           SWITCH TABS                            ---
	------------------------------------------------------------------------
	{
		key = "[",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
}

--wezterm.on("gui-startup", function(cmd)
--local tab, pane, window = mux.spawn_window(cmd or {})
--window:gui_window():maximize()
--end)

wezterm.on("update-right-status", function(window, pane)
	--"Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.fa_clock_o .. "  " .. date },
	}))
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = " " .. tab.tab_id .. " "
	return title
end)

return config

-- Initialize Config
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local opacity = 0.75
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font",
		weight = "DemiBold",
	},
	"Jetbrains Mono",
})
config.font_size = 12.5

-- Window
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE" -- INTEGRATED_BUTTONS Puts the tabs up top with the titlebar
config.window_background_opacity = opacity
config.window_close_confirmation = "NeverPrompt"
-- Window gradient
--config.window_background_gradient = {
--  colors = { '#603e37', '#241f3f' },
  -- Specifices a Linear gradient starting in the top left corner.
--  orientation = { Linear = { angle = -45.0 } },
--}
-- Transparent titlebar
config.window_frame = {
	inactive_titlebar_bg = transparent_bg,
	active_titlebar_bg = transparent_bg,
}

-- Colors
config.colors = require("cyberdream")

-- Tabs
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.colors.tab_bar = {
	background = transparent_bg,
}

return config

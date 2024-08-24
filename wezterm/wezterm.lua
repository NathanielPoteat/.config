-- Initialize Config
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local opacity = 0.75
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"
local launch_menu = {}

-- Determine OS
local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil
local is_windows <const> = wezterm.target_triple:find("windows") ~= nil

-- Default Shell and Launch Menu
if is_windows then
    config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' }

    table.insert(launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    })

  -- Find installed visual studio version(s) and add their compilation environment command prompts to the menu
  for _, vsvers in
    ipairs(
      wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
    )
  do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(launch_menu, {
      label = 'x64 Native Tools VS ' .. year,
      args = {
        'cmd.exe',
        '/k',
        'C:/Program Files (x86)/'
          .. vsvers
          .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
      },
    })
  end

  config.launch_menu = launch_menu
end
--if is_linux or is_darwin then
--    config.default_prog = -- zsh

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

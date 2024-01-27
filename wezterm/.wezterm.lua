-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato"

config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13
config.line_height = 1.1

config.enable_tab_bar = false
config.cursor_blink_rate = 0
config.animation_fps = 144
config.max_fps = 144
config.bold_brightens_ansi_colors = "No"
config.cursor_thickness = "1pt"

config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config

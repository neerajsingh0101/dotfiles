-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices.
-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
-- or, changing the font size and color scheme.
-- WezTerm bundles JetBrains Mono + Nerd Font Symbols + emoji;
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Symbols Nerd Font Mono",
  "Noto Color Emoji",
})
config.font_size = 16.0
config.line_height = 1.05
config.color_scheme = 'Catppuccin Mocha'  -- Choose one color scheme
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 10,
  right = 10,
  top = 8,
  bottom = 8,
}
-- Key bindings for splitting panes
config.keys = {
  -- Split (left/right)
  {
    key = 'i',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Split (top/bottom)
  {
    key = 'u',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Navigate between panes with Alt+Arrow keys
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Close current pane
  {
    key = 'w',
    mods = 'CTRL|ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Resize panes
  {
    key = 'LeftArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
}

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.3,
}

-- Finally, return the configuration to wezterm:
return config

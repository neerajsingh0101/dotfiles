local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Symbols Nerd Font Mono",
  "Noto Color Emoji",
})
config.font_size = 17.0
config.line_height = 1.1
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

-- Disable quit confirmation
config.window_close_confirmation = 'NeverPrompt'

-- Default (generic) bindings
local pane_resize_keys = {
  left  = "LeftArrow",
  right = "RightArrow",
}

-- Local override by trying to load wezterm_local.lua
local ok, local_overrides = pcall(require, "wezterm_local")
if ok and type(local_overrides) == "table" and type(local_overrides.pane_resize_keys) == "table" then
  pane_resize_keys.left  = local_overrides.pane_resize_keys.left  or pane_resize_keys.left
  pane_resize_keys.right = local_overrides.pane_resize_keys.right or pane_resize_keys.right
end

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
  -- Navigate between panes with Ctrl+Alt keys
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
  -- Command K to clear the console
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.Multiple({
        wezterm.action.ClearScrollback("ScrollbackAndViewport"),
        wezterm.action.SendKey({ key = "L", mods = "CTRL" }), -- optional: like "clear"
    }),
  },
  -- Resize panes
  {
    key = pane_resize_keys.left,
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = pane_resize_keys.right,
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

-- Dim the inactive pane so that we can detect the active pane
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.3,
}

return config
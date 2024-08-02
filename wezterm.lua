local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Startup command
config.default_prog = {"/usr/bin/zsh", "-l"}

-- Font configuration
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0
config.hide_mouse_cursor_when_typing = true

-- Pane settings
config.initial_cols = 92
config.initial_rows = 23
config.adjust_window_size_when_changing_font_size = true
config.scrollback_lines = 10000

-- Font and Color Overrides
config.font_rules = {
  {
    italic = true,
    font = wezterm.font("MesloLGS NF", {italic=true}),
  },
  {
    intensity = "Bold",
    font = wezterm.font("MesloLGS NF", {weight="Bold"}),
  }
}

-- Color scheme
config.color_scheme = "Dracula"

-- Enable tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Environment variables
config.set_environment_variables = {
  LANG = "en_US.UTF-8",
}

-- Wayland support
config.enable_wayland = true

-- Key Bindings
config.keys = {
  -- Split the current pane horizontally
  {key="|", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  -- Split the current pane vertically
  {key="?", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  -- Move to the next pane
  {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
  -- Move to the previous pane
  {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
  -- Copy to clipboard
  {key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard")},
  -- Paste from clipboard
  {key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom("Clipboard")},
  -- Close current pane
  {key="q", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  -- New tab
  {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="DefaultDomain"}},
  -- Next tab
  {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
  -- Previous tab
  {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
  -- Move to the beginning of the line (HOME key)
  {key="Home", mods="NONE", action=wezterm.action{SendString="\x1b[H"}},  -- HOME
  -- Move to the end of the line (END key)
  {key="End", mods="NONE", action=wezterm.action{SendString="\x1b[F"}},    -- END
}

-- Color and Tab Bar Settings
config.colors = {
  foreground = "#CBE0F0",
  background = "#011423",
  cursor_bg = "#47FF9C",
  cursor_border = "#47FF9C",
  cursor_fg = "#011423",
  selection_bg = "#033259",
  selection_fg = "#CBE0F0",
  ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  tab_bar = {
    background = "#0b0022",
    active_tab = {
      bg_color = "#2b2042",
      fg_color = "#c0c0c0",
    },
    inactive_tab = {
      bg_color = "#1b1032",
      fg_color = "#808080",
    },
    inactive_tab_hover = {
      bg_color = "#3b3052",
      fg_color = "#909090",
      italic = true,
    },
  },
}

-- UI Tweaks
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

-- Set custom window title and tab title using event handlers
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
  return "MTR"
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    {Text="mtr"},
  }
end)

return config

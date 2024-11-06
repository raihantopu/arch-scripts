local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Startup command
config.default_prog = {"/usr/bin/zsh", "-l"}

-- Font configuration
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0
config.hide_mouse_cursor_when_typing = true

-- Pane settings
config.initial_cols = 120; config.initial_rows = 30
config.adjust_window_size_when_changing_font_size = true
config.scrollback_lines = 10000

-- Font and Color Overrides
config.font_rules = {
  {italic=true, font=wezterm.font("MesloLGS NF", {italic=true})},
  {intensity="Bold", font=wezterm.font("MesloLGS NF", {weight="Bold"})}
}

-- Color Scheme
config.colors = {
  foreground = "#CBE0F0", background = "#1B2A41",
  cursor_bg = "#0AD1C8", cursor_border = "#0AD1C8", cursor_fg = "#1B2A41",
  selection_bg = "#0F3D4F", selection_fg = "#F5F7FA",
  ansi = {"#1B2A41", "#D9534F", "#44FFB1", "#FFD47E", "#14919B", "#A277FF", "#45DFB1", "#CBE0F0"},
  brights = {"#2D3B53", "#E57373", "#A3BE8C", "#EBCB8B", "#81A1C1", "#B48EAD", "#8FBCBB", "#ECEFF4"},
  tab_bar = {
    background = "#142639",
    active_tab = {bg_color="#14919B", fg_color="#CBE0F0"},
    inactive_tab = {bg_color="#1B2A41", fg_color="#808080"},
    inactive_tab_hover = {bg_color="#0AD1C8", fg_color="#909090", italic=true}
  }
}

-- Enable Tab Bar
config.hide_tab_bar_if_only_one_tab = true

-- Environment Variables and Wayland support
config.set_environment_variables = {LANG = "en_US.UTF-8"}
config.enable_wayland = true

-- Key Bindings
config.keys = {
  {key="|", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  {key="?", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
  {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
  {key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard")},
  {key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom("Clipboard")},
  {key="q", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="DefaultDomain"}},
  {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
  {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
  {key="Home", mods="NONE", action=wezterm.action{SendString="\x1b[H"}},
  {key="End", mods="NONE", action=wezterm.action{SendString="\x1b[F"}},
  {key="Delete", mods="NONE", action=wezterm.action.SendString("\x1b[3~")},
  {key="L", mods="CTRL|SHIFT", action=wezterm.action{ClearScrollback="ScrollbackAndViewport"}},
  {key="R", mods="CTRL|SHIFT", action="ReloadConfiguration"}
}

-- UI Tweaks
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

-- Tab titles
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
  return "MTR"
end)
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  return {{Text = title ~= "" and title or "Shell"}}
end)

return config

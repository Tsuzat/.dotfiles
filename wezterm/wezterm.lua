local wezterm = require "wezterm"


return {
  default_prog = {
    'C:\\Users\\aloks\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe' },
  font = wezterm.font 'FiraCode Nerd Font',
  font_size = 14,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.8,
  initial_rows = 30,
  initial_cols = 100,
  color_scheme = 'NeoSolarized Dark',
  color_scheme_dirs = { "~/.dotfiles/wezterm/colors" },
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  default_cursor_style = 'SteadyBar',
}

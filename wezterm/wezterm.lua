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
  colors = {
    background = '#001217',
    foreground = "#708183",
    cursor_bg = "#708183",
    selection_bg = "#fcf4dc",
    selection_fg = "#001e26",
    tab_bar = {
      background = '#073642',
      active_tab = {
        fg_color = "#181926",
        bg_color = "#268bd2",
      },
      inactive_tab = {
        fg_color = "#CAD3F5",
        bg_color = "#586e75",
      },
    },
  },
  windows_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  default_cursor_style = 'SteadyBar',
}

local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

NeoSolarized.setup {
  style = "dark", -- "dark" or "light"
  transparent = true, -- Enable this to disable setting the background color
  lineNr = true, -- transparent LineNr, put false to make it visible
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  enable_italics = true, -- Italics for different hightlight groups
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    variables = {},
    underline = { undercurl = true },
    string = { italic = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
  use_background = false, -- can be light/dark/auto. When auto, background will be set to vim.o.background
}

vim.cmd [[
   try
        colorscheme NeoSolarized
    catch /^Vim\%((\a\+)\)\=:E18/
        colorscheme default
        set background=dark
    endtry
]]

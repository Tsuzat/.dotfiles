local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

NeoSolarized.setup {
  style = "dark", -- "dark" or "light"
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    variables = {},
    string = { italic = true },
    underline = true,
    undercurl = true,
  },
}

vim.cmd [[
   try
        colorscheme NeoSolarized
    catch /^Vim\%((\a\+)\)\=:E18o
        colorscheme default
        set background=dark
    endtry
]]

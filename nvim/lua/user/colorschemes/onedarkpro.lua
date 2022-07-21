local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
  return
end

onedarkpro.setup({
    dark_theme = "onedark_vivid", -- theme = "onedark", -- Or "onelight", "onedark_vivid", "onedark_dark"
    light_theme = "onelight", -- The default light theme
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    hlgroups = {}, -- Override default highlight groups
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    plugins = { -- Override which plugins highlight groups are loaded
      -- NOTE: Plugins have been omitted for brevity - Please see the plugins section of the README
    },
    styles = { -- Choose from "bold,italic,underline"
        strings = "NONE", -- Style that is applied to strings. 
        comments = "italic", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        functions = "italic", -- Style that is applied to functions
        variables = "NONE", -- Style that is applied to variables
        virtual_text = "italic", -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use the themes opinionated bold styles?
        italic = true, -- Use the themes opinionated italic styles?
        undercurl = true, -- Use the themes opinionated undercurl styles?
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    }
})

vim.cmd [[
    try
        colorscheme onedarkpro
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
]]


-- Recommended Setting for transparent experience
-- vim.cmd [[
--     try
--         colorscheme onedarkpro
--     catch /^Vim\%((\a\+)\)\=:E185/
--         colorscheme default
--         set background=dark
--     endtry
--         highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
--         highlight link NormalFloat Normal 
--         highlight NormalFloat ctermbg=BLACK ctermfg=NONE guibg=NONE guifg=NONE 
--         highlight Pmenu ctermbg=NONE guibg=NONE 
-- ]]



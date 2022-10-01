-- gruvbox-material Settings
vim.g.gruvbox_material_background = 'hard' --hard, medium (default) and soft
vim.g.gruvbox_material_foreground = 'original' -- material, mix, original
vim.g.gruvbox_material_better_performance = 1 --For Better Performance
vim.g.gruvbox_material_visual = 'green background'
vim.g.gruvbox_material_cursor = 'auto' -- auto,red,orange,yellow,green,aqua,blue,purple
vim.g.gruvbox_material_sign_column_background = 'none' -- none, grey
vim.g.gruvbox_material_ui_contrast = 'high' -- high, low
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1 -- Only for font supports cursive italic
vim.g.gruvbox_material_transparent_background = 1 -- 0, 1 or 2
vim.g.gruvbox_material_diagnostic_text_highlight = 1 -- 0 or 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' --grey or colored
vim.g.gruvbox_material_current_word = 'italic' -- bold, underline, italic, grey
vim.g.gruvbox_material_statusline_style = 'original' -- default, mix, original

vim.cmd [[
    try
        colorscheme gruvbox-material
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
        highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
        highlight link NormalFloat Normal 
        highlight NormalFloat ctermbg=NONE guibg=NONE 
        highlight Pmenu ctermbg=NONE guibg=NONE 
]]

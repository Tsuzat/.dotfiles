-- Change Shell based on OS (Windows and Linux)
local shell = vim.fn.has('win32') == 1 and "pwsh.exe" or
    "fish"


local options = {
  autoindent     = true,                      -- Auto indent
  title          = true,                      -- Show the title
  backup         = false,                     -- creates a backup file
  clipboard      = "unnamedplus",             -- allows neovim to access the system clipboard
  cmdheight      = 1,                         -- more space in the neovim command line for displaying messages
  completeopt    = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel   = 0,                         -- so that `` is visible in markdown files
  cursorline     = true,                      -- highlight the current line
  expandtab      = true,                      -- convert tabs to spaces
  fileencoding   = "utf-8",                   -- the encoding written to a file
  guifont        = "FiraCode Nerd Font:h16",  -- the font used in graphical neovim applications
  hlsearch       = true,                      -- highlight all matches on previous search pattern
  ignorecase     = true,                      -- ignore case in search patterns
  mouse          = "a",                       -- allow the mouse to be used in neovim
  number         = true,                      -- set numbered lines
  numberwidth    = 2,                         -- set number column width to 2 {default 4}
  relativenumber = true,                      -- set relative numbered lines
  scrolloff      = 8,                         -- is one of my fav
  shell          = shell,                     -- Default shell
  shiftwidth     = 2,                         -- the number of spaces inserted for each indentation
  showtabline    = 2,                         -- always show tabs
  showmode       = false,                     -- No need to show mode always
  sidescrolloff  = 8,                         -- May be change it??
  signcolumn     = "yes",                     -- always show the sign column, otherwise it would shift the text each time
  smartcase      = true,                      -- smart case
  smartindent    = true,                      -- make indenting smarter again
  splitbelow     = true,                      -- force all horizontal splits to go below current window
  splitright     = true,                      -- force all vertical splits to go to the right of current window
  swapfile       = false,                     -- creates a swapfile
  tabstop        = 2,                         -- insert 2 spaces for a tab
  termguicolors  = true,                      -- set term gui colors (most terminals support this)
  timeoutlen     = 100,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile       = true,                      -- enable persistent undo
  updatetime     = 300,                       -- faster completion (4000ms default)
  wrap           = false,                     -- display lines as one long line
  writebackup    = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])


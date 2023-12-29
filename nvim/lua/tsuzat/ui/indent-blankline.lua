local ok, ibl = pcall(require, "ibl")

if not ok then
  print("Error loading indent blank line. tsuzat.ui.indent-blankline: line: 1")
end

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")


ibl.setup {
  exclude = {
    filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
    buftypes = { "terminal", "nofile", "telescope" },
  },
  indent = {
    char = "│",
    -- char = "▏",
    tab_char = "│",
  },
  scope = {
    enabled = false,
    show_start = false,
  },
  whitespace = {
    remove_blankline_trail = false,
  },
}


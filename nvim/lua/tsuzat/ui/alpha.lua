local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[██╗    ██╗██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
  [[██║    ██║██║████╗  ██║██║   ██║██║████╗ ████║]],
  [[██║ █╗ ██║██║██╔██╗ ██║██║   ██║██║██╔████╔██║]],
  [[██║███╗██║██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[╚███╔███╔╝██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]]
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find Git Files", ":Telescope git_files <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("l", "  Lazy", ":Lazy<CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      require("lazy").show()
    end,
  })
end

require("alpha").setup(dashboard.opts)

-- Get the time for loading config
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = "✨ Neovim loaded " ..
    stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " ms ✨"
    pcall(vim.cmd.AlphaRedraw)
  end,
})


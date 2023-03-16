local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[ ██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗  ██████╗██╗  ██╗  ]],
  [[ ██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██╔════╝██║  ██║  ]],
  [[ ██║     ██║   ██║██╔██╗ ██║███████║██████╔╝██║     ███████║  ]],
  [[ ██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗██║     ██╔══██║  ]],
  [[ ███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║╚██████╗██║  ██║  ]],
  [[ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝  ]]
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find Git Files", ":Telescope git_files <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.dotfiles/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  return "✨ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

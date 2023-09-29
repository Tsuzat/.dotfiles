local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
})

local servers = {
  "jsonls",
  "lua_ls",
  "html",
  "cssls",
  "emmet_ls",
  "marksman",
}

lspconfig.setup {
  ensure_installed = servers,
  -- Let mason install the servers setup by lsp-config automatically
  -- Do not confuse it with `ensure_install`
  -- automatic_installation = true
}

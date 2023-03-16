local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsphandler = require("tsuzat.lsp.handlers")

lsphandler.setup()

require "tsuzat.lsp.mason"
require "tsuzat.lsp.lspsaga"
require "tsuzat.lsp.flutter-tools"

-- Custome Language settings and setups goes here

local opts = {
  on_attach = lsphandler.on_attach,
  capabilities = lsphandler.capabilities,
}

local servers = {
  "tsserver",
  "clangd",
  "pyright",
  "gopls",
}

for _, server in pairs(servers) do
  lspconf[server].setup(opts)
end

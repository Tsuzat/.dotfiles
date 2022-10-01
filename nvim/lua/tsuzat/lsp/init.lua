local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsphandler = require("tsuzat.lsp.handlers")

lsphandler.setup()

require "tsuzat.lsp.mason"
require "tsuzat.lsp.lspsaga"
require "tsuzat.lsp.lsp_signature"
require "tsuzat.lsp.flutter-tools"

-- Custome Language settings and setups goes here

local opts = {
  on_attach = lsphandler.on_attach,
  capabilities = lsphandler.capabilities,
}

lspconf.tsserver.setup(opts)
lspconf.clangd.setup(opts)
lspconf.pyright.setup(opts)
lspconf.gopls.setup(opts)

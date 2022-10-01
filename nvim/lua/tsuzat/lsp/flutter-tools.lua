local status, flutter = pcall(require, "flutter-tools")

if not status then
  return
end

flutter.setup({
  ui = {
    border = "rounded",
    notification_style = 'native',
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
  },
  on_attach = require("tsuzat.lsp.handlers").on_attach,
  capabilities = require("tsuzat.lsp.handlers").capabilities,
})

local status, lspconfig = pcall(require, "mason-lspconfig")
if not status then
  return
end

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
}


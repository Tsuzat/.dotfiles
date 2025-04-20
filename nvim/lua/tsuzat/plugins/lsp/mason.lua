return {

  "williamboman/mason.nvim",
  -- lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  build = ":Mason",
  cmd = "Mason",

  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()

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
    }

    lspconfig.setup {
      ensure_installed = servers,
    }
  end
}

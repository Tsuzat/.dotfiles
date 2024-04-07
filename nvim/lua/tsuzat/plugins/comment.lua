return {
  "JoosepAlviste/nvim-ts-context-commentstring", -- Comment ts context files
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require('ts_context_commentstring').setup {

      enable = true,
      enable_autocmd = false,
      config = {
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        svelte = "<!-- %s -->",
        vue = "<!-- %s -->",
        json = ""
      }
    }
  end
}

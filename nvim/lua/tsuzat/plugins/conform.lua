return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  lazy = true,
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    local ok, conform = pcall(require, "conform")

    if not ok then
      print("Conform can not be loaded. Refere tsuzat.utils.conform : line 4")
      return
    end

    conform.setup(
      {
        formatters_by_ft = {
          lua = { "stylua", lsp_format = "fallback" },
          python = { "isort", "black", stop_after_first = true },
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          svelte = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          typescript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          css = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          html = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          json = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          yaml = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          markdown = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
          go = { "gofmt", lsp_format = "fallback" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      }
    )
  end
}

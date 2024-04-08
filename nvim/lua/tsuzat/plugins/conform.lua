return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
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
        -- Define your formatters
        formatters_by_ft = {
          python = { "ruff_format" },
          javascript = { { "prettierd", "prettier" } },
          -- svelte = { { "prettierd", "prettier" } },
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      }
    )
  end
}

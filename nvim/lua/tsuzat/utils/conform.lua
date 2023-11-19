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
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  }
)

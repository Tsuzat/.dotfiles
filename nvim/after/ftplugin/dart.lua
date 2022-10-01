vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Format", { clear = true }),
  callback = function() vim.lsp.buf.formatting_sync() end
})

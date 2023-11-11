-- Automatically install lazy.nvim (from Documentation of lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Put Options Here
local opts = {}
-- Plugins are need to be required here
local ok, plugins = pcall(require, "tsuzat.plugins")

if not ok then
  return
end

require("lazy").setup(plugins, opts)

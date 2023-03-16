-- Automatically install packer (from Documentation of packer.nvim)
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

-- Install your plugins here

local plugins = {
  "nvim-lua/plenary.nvim", -- Common Utilities used by many plugins
  "folke/which-key.nvim",  -- very useful plugin
  "MunifTanjim/nui.nvim",

  -- Editor
  "nvim-treesitter/nvim-treesitter", -- Treesitter
  "nvim-telescope/telescope.nvim",
  "windwp/nvim-autopairs",           -- Autopair
  "lukas-reineke/indent-blankline.nvim",
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "norcalli/nvim-colorizer.lua",
  "windwp/nvim-ts-autotag",

  -- Themes
  "Tsuzat/NeoSolarized.nvim",
  "sainnhe/gruvbox-material",

  -- UI Related Plugins
  "goolord/alpha-nvim",
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "p00f/nvim-ts-rainbow",

  -- Autocompletion
  "onsails/lspkind.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "saadparwaiz1/cmp_luasnip",

  -- Languge Server Protocal
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",

  -- GIT
  "lewis6991/gitsigns.nvim",

  -- Comptitive Programming
  "xeluxee/competitest.nvim",

  -- Flutter Tools
  {"akinsho/flutter-tools.nvim"},

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}


local opts = {}

require("lazy").setup(plugins, opts)

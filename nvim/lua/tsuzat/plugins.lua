local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Utils
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Common Utilities
  use("folke/which-key.nvim")

  -- Themes
  use("~/Projects/NeoSolarized.nvim") -- or use ("Tsuzat/NeoSolarized.nvim")
  use("sainnhe/gruvbox-material")

  -- UI Related Plugins
  use("goolord/alpha-nvim")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use("p00f/nvim-ts-rainbow")

  -- Code Editor utils
  use("lukas-reineke/indent-blankline.nvim")
  use("nvim-treesitter/nvim-treesitter")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("norcalli/nvim-colorizer.lua")

  -- Auto Completion
  use("onsails/lspkind.nvim")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")

  -- Language Server Protocol
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("ray-x/lsp_signature.nvim") -- LSP signature hint as you type
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
        border_style = "rounded",
        max_preview_lines = 15,
        code_action_lightbulb = {
          sign = false,
        },
      })
    end,
  })

  -- Flutter Tools
  use("akinsho/flutter-tools.nvim")

  -- Code Formatter TODO
  use("MunifTanjim/prettier.nvim")
  use("jose-elias-alvarez/null-ls.nvim")

  -- Snippet Providers
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")
  use("saadparwaiz1/cmp_luasnip")

  -- Fuzzy Finder
  use("nvim-telescope/telescope.nvim")

  -- GIT
  use("lewis6991/gitsigns.nvim")

  -- Competitive Programming
  use({
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
  })

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

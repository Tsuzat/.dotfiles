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

-- Install your plugins here

local plugins = {
  "nvim-lua/plenary.nvim", -- Common Utilities used by many plugins
  { "MunifTanjim/nui.nvim",        lazy = true, },

  -- very useful plugin
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local conf = require "tsuzat.core.which-key"
      local which_key = require("which-key")
      which_key.setup(conf.setup)
      which_key.register(conf.mappings, conf.opts)
    end
  },

  -- Editor -

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "tsuzat.code.tree-sitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "tsuzat.core.telescope",
    config = function(_, opts)
      require("telescope").setup(opts)
    end
  },
  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    opts = require "tsuzat.code.autopair",
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end
  },
  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "tsuzat.core.indentline",
    config = function(_, opts)
      vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"
      -- vim.opt.listchars:append "space:"
      vim.opt.listchars:append "eol:↴" -- Or use ﬋
      require("indent_blankline").setup(opts)
    end
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "tsuzat.code.comment",
    config = function(_, opts)
      require("Comment").setup(opts)
    end
  },
  "norcalli/nvim-colorizer.lua",                 -- For color visualization
  "JoosepAlviste/nvim-ts-context-commentstring", -- Comment ts context files
  "windwp/nvim-ts-autotag",                      -- useful for html auto tagging

  -- Themes
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins    opts = require "tsuzat.themes.NeoSolarized",
    config = function()
      local opts = require "tsuzat.themes.NeoSolarized"
      require("NeoSolarized").setup(opts)
      vim.cmd [[ colorscheme NeoSolarized ]]
    end
  },

  -- UI Related Plugins

  -- Alpha
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local dashboard = require "tsuzat.core.alpha"
      -- Close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      -- Get the time for loading config
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- LuaLine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require "tsuzat.core.lualine"
    end
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "tsuzat.core.nvim-tree"
    end
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    config = function()
      local opts = require "tsuzat.core.bufferline"
      require("bufferline").setup {
        options = opts.options,
        highlights = opts.highlights
      }
    end
  },

  "p00f/nvim-ts-rainbow", -- For multicolor brackets

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim", -- Gives VSCode like completion menu
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require "tsuzat.code.cmp"
    end
  },

  -- Languge Server Protocal

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "tsuzat.lsp.lspconfig"
    end
  },

  -- LSP Saga
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require "tsuzat.lsp.lspsaga"
    end
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":Mason",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "tsuzat.lsp.mason"
    end
  },

  -- GIT
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "tsuzat.code.gitsigns"
    end
  },

  -- Comptitive Programming
  {
    "xeluxee/competitest.nvim",
    config = function()
      require "tsuzat.others.competitest"
    end
  },

  -- Flutter Tools
  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require "tsuzat.others.flutter_tools"
    end
  },

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

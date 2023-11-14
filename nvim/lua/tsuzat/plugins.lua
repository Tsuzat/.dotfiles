return {
  -- Utilities used by many
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "MunifTanjim/nui.nvim",        lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- NvimTree : File Explorer for NeoVim
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = "NvimTreeToggle",
    config = function()
      require "tsuzat.ui.nvim-tree"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "tsuzat.ui.alpha"
    end,
  },

  -- Themes
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require "tsuzat.themes.NeoSolarized"
      -- vim.cmd [[ colorscheme NeoSolarized ]]
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require "tsuzat.themes.tokyonight"
      -- vim.cmd[[colorscheme tokyonight-night]]
    end
  },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "tsuzat.themes.catppuccin"
      vim.cmd [[colorscheme catppuccin-mocha]]
    end

  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
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
      require "tsuzat.editor.cmp"
    end
  },
  -- (LSP) Languge Server Protocal

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "tsuzat.lsp.lspconfig"
    end
  },

  -- LSP Saga
  {
    "nvimdev/lspsaga.nvim",
    -- lazy = true,
    event = "LspAttach",
    config = function()
      require "tsuzat.lsp.lspsaga"
    end
  },

  -- Mason: Usefull to download language servers
  {
    "williamboman/mason.nvim",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    build = ":Mason",
    cmd = "Mason",
    config = function()
      require "tsuzat.lsp.mason"
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Comment ts context files
      "windwp/nvim-ts-autotag",
      "p00f/nvim-ts-rainbow",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "tsuzat.editor.treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  -- GitSign: Git Utilities
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "tsuzat.utils.gitsign"
    end
  },

  -- AutoPair: Auto Pairs (), {}, [], "", '' etc...
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require "tsuzat.editor.autopair"
    end
  },

  -- Indent Blank Line: Provides Indentation UI
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "eol:↴" -- Or use ﬋
      require "tsuzat.ui.indent-blankline"
    end
  },

  -- Mini Indentscope: Nice animated indent scope
  {
    "echasnovski/mini.indentscope",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'alpha',
          'coc-explorer',
          'dashboard',
          'fzf', -- fzf-lua
          'help',
          'lazy',
          'lazyterm',
          'lspsagafinder',
          'mason',
          'neo-tree',
          'nnn',
          'notify',
          'NvimTree',
          'qf',
          'starter', -- mini.starter
          'toggleterm',
          'Trouble',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      require('mini.indentscope').setup()
    end,
  },

  -- BufferLine: Use Buffers as Tabs and more
  {
    "akinsho/bufferline.nvim",
    config = function()
      require "tsuzat.ui.bufferline"
    end
  },

  -- Comment: Handles the commenting language based files
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = require "tsuzat.utils.comment",
    config = function(_, opts)
      require("Comment").setup(opts)
    end
  },

  -- Telescope: Very Powerful tool for searching files, text and more
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    config = function()
      require "tsuzat.utils.telescope"
    end
  },

  -- WakaTime: Tracks your active time Across the devices
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    lazy = true
  },

  -- Markdown Preview: Real time markdown preview in a browser
  {
    "iamcco/markdown-preview.nvim",
    --[[ lazy = true,
    event = "VeryLazy", ]]
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Which Key: Short Keys manager
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      local conf = require "tsuzat.utils.whichkey"
      local which_key = require("which-key")
      which_key.setup(conf.setup)
      which_key.register(conf.mappings, conf.opts)
    end
  },

  -- Lualine: An amazing Status line for NeoVim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require "tsuzat.ui.lualine"
    end
  },

  -- Colorizer: Visualize Colors in any buffer
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "VeryLazy",
    cmd = "ColorizerToggle",
    config = function()
      require "tsuzat.utils.colorizer"
    end
  },

  -- Comptitest: Helpful utility for CP
  {
    "xeluxee/competitest.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = "ComptiTest",
    config = function()
      require "tsuzat.utils.competitest"
    end
  },

  -- Flutter Tool: Provides good tooling for Flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    event = "VeryLazy",
    ft = "dart",
    config = function()
      require "tsuzat.utils.flutter-tools"
    end
  },
}

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
      local dashboard = require "tsuzat.ui.alpha"
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
          dashboard.section.footer.val = "✨ Neovim loaded " .. stats.count .. " plugins in " .. ms .. " ms ✨"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- Themes
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[ colorscheme NeoSolarized ]]
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
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "tsuzat.lsp.lspconfig"
    end
  },

  -- LSP Saga
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require "tsuzat.lsp.lspsaga"
    end
  },

  -- Mason
  -- TODO: Mason can not be put
  {
    "williamboman/mason.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    build = ":Mason",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    cmd = "Mason",
    config = function()
      require "tsuzat.lsp.mason"
    end
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
      local opts = require "tsuzat.ui.bufferline"
      require("bufferline").setup {
        options = opts.options,
        highlights = opts.highlights
      }
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
    opts = require "tsuzat.utils.telescope",
    config = function(_, opts)
      require("telescope").setup(opts)
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
    lazy = true,
    event = "VeryLazy",
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
      local conf = require "tsuzat.utils.which-key"
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

}
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.opt.list = true
      -- vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")

      require("ibl").setup {
        exclude = {
          filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
          buftypes = { "terminal", "nofile", "telescope" },
        },
        indent = {
          char = "│",
          -- char = "▏",
          tab_char = "│",
        },
        scope = {
          enabled = false,
          show_start = false,
        },
        whitespace = {
          remove_blankline_trail = false,
        },
      }
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


}

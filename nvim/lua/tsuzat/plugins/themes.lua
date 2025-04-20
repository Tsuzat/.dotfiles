return {
  {
    dir = "~/Projects/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme "NeoSolarized"
    end
  },
  {
    "catppuccin/nvim",
    lazy = true,
    event = "VeryLazy",
    -- priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true
      })
    end
  }
}

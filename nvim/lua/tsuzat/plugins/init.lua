return {
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "MunifTanjim/nui.nvim",        lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    lazy = true
  },
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    lazy = true,
    --[[ opts = {
      statuscolumn = {
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = false,            -- show open fold icons
          git_hl = false,          -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50, -- refresh at most every 50ms
      }
    } ]]
  }
}

return {
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "MunifTanjim/nui.nvim",        lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    lazy = true
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}

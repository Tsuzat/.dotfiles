return {
  "windwp/nvim-autopairs",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("nvim-autopairs").setup()
  end
}

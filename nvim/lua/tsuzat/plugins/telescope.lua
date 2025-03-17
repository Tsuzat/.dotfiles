return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  config = function()
    require("telescope").setup {
      {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          mappings = {
            -- TODO Find the correct and useful key mappings
            i = {
            },
            n = {
            },
          },
          file_ignore_patterns = {
            "node_modules"
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        },
      }
    }
  end
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0,
  config = function()
    local M = {}
    M.options = {
      numbers = "none",                        -- can be "none" | "ordinal" | "buffer_id" | "both" | function
      close_command = "bdelete! %d",           -- can be a string | function, see "Mouse actions"
      right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",        -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,              -- can be a string | function, see "Mouse actions"
      indicator = {
        -- icon = "▎",
        icon = "|",
        style = 'icon'
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = false,    -- "nvim_lsp"
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "NvimTree",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
        },
        {
          filetype = "packer",
          text = "Packer",
          padding = 1,
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = { "|", "|" },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      sort_by = "id",
    }

    M.highlights = {
      fill = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      background = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      buffer_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      tab = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_close = {
        fg = { attribute = "fg", highlight = "TabLineSel" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      duplicate_selected = {
        fg = { attribute = "fg", highlight = "TabLineSel" },
        bg = { attribute = "bg", highlight = "TabLineSel" },
        italic = true,
      },
      duplicate_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
        italic = true,
      },
      duplicate = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
        italic = true,
      },
      modified = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      modified_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      modified_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      separator = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      separator_selected = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      indicator_selected = {
        fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
    }

    require("bufferline").setup {
      options = M.options,
      highlights = M.highlights
    }
  end
}

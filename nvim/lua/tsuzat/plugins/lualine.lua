return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = true,
      always_visible = true,
    }

    local treesitter = {
      function()
        local b = vim.api.nvim_get_current_buf()
        if next(vim.treesitter.highlighter.active[b]) then
          return ""
        end
        return ""
      end,
      color = { fg = "#98be65" },
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      -- source = diff_source,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      update_in_insert = true,
      cond = hide_in_width
    }

    local lsp = {
      function()
        local t = {}
        for _, client in ipairs(vim.lsp.get_clients()) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] then
            if client.name ~= "null-ls" then
              t[#t + 1] = tostring(client.name)
            end
          end
        end
        if not next(t) then
          return " No LSP "
        end
        return "   " .. (table.concat(t, ", ") or "No LSP")
      end,
      color = { gui = "bold" },
      -- cond = hide_in_width,
    }

    require("lualine").setup {
      options = {
        icons_enabled = true,
        -- theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', diff },
        lualine_c = { treesitter },
        lualine_x = { diagnostics, lsp, "filetype" },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {}
    }
  end
}

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local setup = function()
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = "󰋼 ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })

      local config = {
        -- your config
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          format = function(d)
            local code = d.code or (d.user_data and d.user_data.lsp.code)
            if code then
              return string.format("%s [%s]", d.message, code):gsub("1. ", "")
            end
            return d.message
          end,
        },
      }

      vim.diagnostic.config(config)

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "rounded",
          width = 60,
        })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = "rounded",
          width = 60,
        })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          update_in_insert = true,
          virtual_text = { spacing = 4, prefix = "●" },
          severity_sort = true,
        })
    end

    -- TODO: Rethink the key maps

    local function lsp_keymaps(bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", opts) ]]
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    end

    local on_attach = function(client, bufnr)
      -- Format on save
      --[[ if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function(args)
            require("conform").format({ bufnr = args.buf })
          end,
        })
      end ]]
      lsp_keymaps(bufnr)
    end


    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not status_ok then
      return
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Running setup
    setup()

    local status, nvim_lsp = pcall(require, "lspconfig")
    if not status then
      return
    end

    -- Setup Your Language Servers and thier options here
    -- e.g. nvim_lsp.clangd.setup{ capabilities = capabilities, on_attach = on_attach}

    nvim_lsp.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    }

    -- Need to Exclude the Directory patterns which does not have tailwindcss setup
    nvim_lsp.tailwindcss.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function(fname)
        return require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts",
          "tailwind.config.mjs")(
          fname)
      end,
    }
    -- Servers that needs a simple setup; are provided here.
    local servers = {
      "clangd",
      "jsonls",
      "jdtls",
      "cssls",
      "html",
      "emmet_ls",
      "marksman",
      "ts_ls",
      "pyright",
      "gopls",
      "svelte",
      -- "tailwindcss",
      "rust_analyzer",
    }

    local ops = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    for _, server in pairs(servers) do
      nvim_lsp[server].setup(ops)
    end
  end
}

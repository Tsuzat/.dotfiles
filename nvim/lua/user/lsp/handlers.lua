local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
            format = function(d)
                local t = vim.deepcopy(d)
                local code = d.code or (d.user_data and d.user_data.lsp.code)
                if code then
                    t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
                end
                return t.message
            end,
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

-- local function lsp_keymaps(bufnr)
-- 	local opts = { noremap = true, silent = true }
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(
-- 		bufnr,
-- 		"n",
-- 		"gl",
-- 		'<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>',
-- 		opts
-- 	)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- 	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
-- end

M.on_attach = function(client, bufnr)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
    -- 	-- Mappings.
    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    -- lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Code actions
capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }
}

capabilities.textDocument.completion.completionItem.snippetSupport = true;
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M

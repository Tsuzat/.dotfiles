local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
	    return {
		    added = gitsigns.added,
		    modified = gitsigns.changed,
		    removed = gitsigns.removed,
	    }
	end
end


local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
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
	source = diff_source,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	diff_color = {
		added = { fg = "#98be65" },
		modified = { fg = "#ECBE7B" },
		removed = { fg = "#ec5f67" },
	},
	update_in_insert = true,
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local tab = {
    function()
        if not vim.api.nvim_buf_get_option(0, "expandtab") then
            return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
        end
        local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
        if size == 0 then
            size = vim.api.nvim_buf_get_option(0, "tabstop")
        end
        return "Spaces: " .. size .. " "
    end,
    cond = hide_in_width,
    color = {},
}

local lsp = {
    function()
        local t = {}
        for _, client in ipairs(vim.lsp.get_active_clients()) do
            if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                if client.name ~= "null-ls" then
                    t[#t+1] = tostring(client.name)
                end
            end
        end
        if not next(t) then
            return " No LSP "
        end
        return "   " .. (table.concat(t,", ") or "No LSP")
    end,
    color = { gui = "bold" },
    cond = hide_in_width,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = "", right = "" },
    	section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode, treesitter },
		lualine_c = {diff, lsp},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { tab, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
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
	extensions = {},
})

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "[" .. str:sub(0,1) .. "]"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "ﲖ " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. ""
end

-- integrate with nvim-gps
local gps_status_ok, gps = pcall(require, "nvim-gps")
if not gps_status_ok then
  print("nvim-gps required for lualine")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha" },
		always_divide_middle = false,
    globalstatus = true,
	},
	sections = {
		lualine_a = { mode, "filename", "filesize" },
		lualine_b = { branch, diagnostics },
		lualine_c = { { gps.get_location, cond = gps.is_available } },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff },
		lualine_y = { filetype, spaces, "encoding"},
		lualine_z = { location, "os.date('%H:%M')" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

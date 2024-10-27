local cmd = require("helpers.misc").cmd

---@type boolean
local is_windows = vim.fn.has("win32") ~= 1
---@type table
local specs = {
	{
		"andweeb/presence.nvim",
		lazy = false,
		opts = {
			main_image = "file",
			enable_line_number = true,
		},
	},
	{
		"mistricky/codesnap.nvim",
		enabled = is_windows,
		build = "make",
		opts = {
			has_line_number = true,
			bg_theme = "peach",
			has_breadcrumbs = true,
			show_workspace = true,
			watermark = "",
		},
		keys = {
			{
				"<Leader>C",
				cmd "CodeSnap",
				desc = "Take a *fancy* screenshot",
				mode = "v",
			},
		},
	},
}

return specs

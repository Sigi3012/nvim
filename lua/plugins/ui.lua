local cmd = require("helpers.misc").cmd

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			extensions = {
				"nvim-tree",
				"toggleterm",
				"trouble",
				"mason",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				command_palette = true,
				inc_rename = true,
			},
		},
	},
	{
		"mvllow/modes.nvim",
		opts = {
			line_opacity = 0.3,
			set_cursor = true,
			set_number = true,
			ignore_filetypes = {
				"NvimTree",
				"TelescopePrompt",
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = "InsertEnter",
		opts = {
			draw = {
				delay = 0,
				animation = function(_, _)
					return 15
				end,
			},
			symbol = "│",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "InsertEnter",
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				enabled = false,
			},
		},
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = "WinLeave",
		opts = {
			no_exec_files = {
				"NvimTree",
				"TelescopePrompt",
				"mason",
			},
			smooth = true,
		},
	},
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		opts = {},
		keys = {
			{
				"<Leader>Wm",
				cmd("WindowsMaximize"),
				desc = "Maximize selected window",
			},
			{
				"<Leader>Wh",
				cmd("WindowsMaximizeHorizontally"),
				desc = "Maximize selected window horizontally",
			},
			{
				"<Leader>Wv",
				cmd("WindowsMaximizeVertically"),
				desc = "Maximize selected window vertically",
			},
			{
				"<Leader>We",
				cmd("WindowsEqualize"),
				desc = "Rebalance windows",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				themable = true,
				color_icons = true,
				show_buffer_close_icons = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, _, _)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						separator = true,
					},
				},
			},
		},
	},
	{
		"lewis6991/satellite.nvim",
		opts = {},
	},
}

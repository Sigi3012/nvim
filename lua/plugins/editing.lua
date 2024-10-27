local cmd = require("helpers.misc").cmd

return {
	{
		"max397574/better-escape.nvim",
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		opts = {
			save_in_cmdline_history = false,
		},
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{
				"kkharji/sqlite.lua",
				module = "sqlite",
			},
		},
		event = "TextYankPost",
		opts = {
			history = 25,
			enable_persistent_history = true,
		},
		keys = {
			{
				"<Leader>yv",
				cmd("Telescope neoclip"),
				desc = "Open neoclip",
			},
		},
	},
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			position = "right",
			layout = "right",
		},
		keys = {
			{
				"<Leader>u",
				cmd("lua require('undotree').toggle()"),
				desc = "Open undotree",
			},
		},
	},
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			local leap = require("leap")
			leap.create_default_mappings()
			require("leap.user").set_repeat_keys("<enter>", "<backspace>")
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},
}

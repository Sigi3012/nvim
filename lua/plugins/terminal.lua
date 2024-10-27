local cmd = require("helpers.misc").cmd

return {
	{
        "akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
			shade_terminals = true,
		},
		keys = {
			{
				"<Leader>tt",
				-- I generally use vertical the most hense why it is bound this way
				cmd "ToggleTerm direction=vertical",
				desc = "Open terminal (vertical)",
			},
			{
				"<Leader>th",
				cmd "ToggleTerm direction=horizontal",
				desc = "Open terminal (horizontal)",
			},
			{
				"<Leader>tf",
				cmd "ToggleTerm direction=float",
				desc = "Open terminal (float)",
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<Leader>tg",
				cmd "LazyGit",
				desc = "Open Lazygit",
			},
		},
	},
	{
		"mgierada/lazydocker.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<Leader>td",
				cmd "Lazydocker",
				desc = "Open Lazydocker",
			},
		},
	},
}

local cmd = require("helpers.misc").cmd

return {
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		lazy = false,
		opts = {},
		keys = {
			{
				"<Leader>gd",
				cmd "Gitsigns diffthis",
				desc = "View diff",
			},
			{
				"<Leader>gr",
				cmd "Gitsigns reset_buffer",
				desc = "Reset buffer",
			},
		},
	},
	{
		"isakbm/gitgraph.nvim",
		depdendencies = {
			"sindrets/diffview.nvim",
		},
		opts = {
			hooks = {
				-- Check diff of a commit
				on_select_commit = function(commit)
					vim.notify("DiffviewOpen " .. commit.hash .. "^!")
					vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
				end,
				-- Check diff from commit a -> commit b
				on_select_range_commit = function(from, to)
					vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
					vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
				end,
			},
		},
		keys = {
			{
				"<Leader>gg",
				function()
					require("gitgraph").draw({}, { all = true, max_count = 500 })
				end,
				desc = "Open git graph",
			},
		},
	},
}

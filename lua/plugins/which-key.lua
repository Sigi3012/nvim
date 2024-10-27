return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>f", name = "find" },
			{ "<leader>l", name = "lsp" },
			{ "<leader>g", name = "git" },
			{ "<leader>lr", name = "rust" },
			{ "<leader>lc", name = "crates" },
			{ "<leader>lt", name = "trouble" },
			{ "<leader>t", name = "terminal" },
			{ "<leader>y", name = "yank" },
			{ "<leader>W", name = "window" },
			{ "<leader>b", name = "buffer" },
			{ "<leader>bm", name = "move" },
		},
	},
}

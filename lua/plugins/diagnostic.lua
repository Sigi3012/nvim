local cmd = require("helpers.misc").cmd

return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>ltx",
				cmd("Trouble diagnostics toggle"),
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>ltX",
				cmd("Trouble diagnostics toggle filter.buf=0"),
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>lts",
				cmd("Trouble symbols toggle focus=false"),
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>ltl",
				cmd("Trouble lsp toggle focus=false win.position=right"),
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>ltL",
				cmd("Trouble loclist toggle"),
				desc = "Location List (Trouble)",
			},
			{
				"<leader>ltQ",
				cmd("Trouble qflist toggle"),
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"artemave/workspace-diagnostics.nvim",
		opts = {},
	},
}

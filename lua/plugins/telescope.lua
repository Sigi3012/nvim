local cmd = require("helpers.misc").cmd

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<Leader>ff",
			cmd "Telescope find_files",
			desc = "Find files",
		},
		{
			"<Leader>fb",
			cmd "Telescope buffers",
			desc = "Find buffers",
		},
		{
			"<Leader>fw",
			cmd "Telescope live_grep",
			desc = "Find words",
		},
	},
}

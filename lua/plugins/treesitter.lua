return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"rust",
				"lua",
				"toml",
				"yaml",
				"dockerfile",
				"markdown",
				"markdown_inline",
                "sql",
				"vimdoc",
			},
			sync_install = false,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}

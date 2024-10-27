local cmd = require("helpers.misc").cmd

-- auto close
local function is_modified_buffer_open(buffers)
	for _, v in pairs(buffers) do
		if v.name:match("NvimTree_") == nil then
			return true
		end
	end
	return false
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
			and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
		then
			vim.cmd("quit")
		end
	end,
})

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			--adaptive_size = true,
			centralize_selection = true,
			number = true,
			relativenumber = true,
		},
		renderer = {
			group_empty = true,
			highlight_git = true,
			highlight_opened_files = "all",
			indent_markers = {
				enable = true,
			},
		},
		update_focused_file = {
			enable = true,
		},
		filters = {
			enable = true,
			custom = {
				".git/",
				"target/",
			},
		},
		actions = {
			change_dir = {
				enable = true,
			},
		},
        diagnostics = {
            enable = true,
        }
	},
	keys = {
		{
			"<Leader>e",
			cmd "NvimTreeToggle",
			desc = "Open nvim-tree",
		},
		{
			"<Leader>o",
			cmd "NvimTreeFocus",
			desc = "Focus nvim-tree",
		},
	},
}

local map = require("helpers.keys").map

-- Save and quit
map("n", "<Leader>w", "<CMD>update<CR>", "Save")
map("n", "<Leader>q", "<CMD>q<CR>", "Quit")
map("n", "<Leader>Q", "<CMD>qa<CR>", "Exit nvim")

-- New windows
map("n", "|", "<CMD>vsplit<CR>", "Vertical split")
map("n", "\\", "<CMD>split<CR>", "Horizontal split")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Window resizing
-- map("n", "H", "<CMD>vertical resize -2<CR>")
-- map("n", "L", "<CMD>vertical resize +2<CR>")
-- map("n", "J", "<CMD>resize +2<CR>")
-- map("n", "K", "<CMD>resize -2<CR>")

-- Bufferline
-- For whatever reason this plugin doesn't like lazy's keys
map("n", "<Leader>bs", "<CMD>BufferLinePick<CR>", "Pick buffer")
map("n", "<Leader>bc", "<CMD>BufferLinePickClose<CR>", "Pick buffer to close")
map("n", "<Leader>br", "<CMD>BufferLineCloseRight<CR>", "Close all buffers to the right")
map("n", "<Leader>bl", "<CMD>BufferLineCloseLeft<CR>", "Close all buffers to the left")
map("n", "<Leader>bn", "<CMD>BufferLineCycleNext<CR>", "Cycle forwards")
map("n", "<Leader>bp", "<CMD>BufferLineCyclePrev<CR>", "Cycle backwards")
map("n", "<Leader>bmn", "<CMD>BufferLineMoveNext<CR>", "Move buffer forwards")
map("n", "<Leader>bmp", "<CMD>BufferLineMovePrev<CR>", "Move buffer backwards")
map("n", "<Leader>bP", "<CMD>BufferLineTogglePin<CR>", "Toggle pin")

-- Yank to system clipboard
vim.keymap.set("", "<Leader>yy", '"+y', { noremap = true, desc = "Yank to system clipboard" })

-- ToggleTerm
map("t", "<ESC>", [[<C-\><C-n>]])

-- IncRename
vim.keymap.set("n", "<Leader>r", function()
	return ":IncRename " .. vim.fn.expand("<CWORD>")
end, { expr = true, desc = "Rename" })

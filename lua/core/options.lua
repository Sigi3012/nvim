local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
    winwidth = 10,
    winminwidth = 10,
    equalalways = false
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end

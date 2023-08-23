
vim.o.number = true  -- Show line numbers
vim.o.autoindent = true  -- Copy indent from current line when starting a new line
local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
require('Comment').setup()

vim.api.nvim_set_keymap("n", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', {noremap=true, silent=true})

-- init.lua

require('options')
require('plugins.startup')
require('lsp')
require('highlighting')
require('completion')
require('plugins.lualine')
require('plugins.devicons')
require('plugins.nvimtree')
require('plugins.barbar')
-- COLORSCHEME
require('onedark').load()
require('lsp.cpp')

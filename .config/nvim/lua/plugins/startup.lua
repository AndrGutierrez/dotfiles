require('packer').startup(function()
	use 'neovim/nvim-lspconfig' -- Collection of common configurations for Neovim's built-in LSP client
	use 'nvim-tree/nvim-web-devicons'

	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")

	use {
				'nvim-lualine/lualine.nvim',
				requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		}
	use 'navarasu/onedark.nvim'
	use('nvim-treesitter/nvim-treesitter')
	use('nvim-tree/nvim-tree.lua')
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup {
				-- enable = true,
			}
		end
	})
	use 'numToStr/Comment.nvim'
	  -- Language server
	use {
		"williamboman/mason.nvim",
		-- run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	 }
	-- use {
	-- 	"jiangmiao/auto-pairs",
	-- 	config = function() require("nvim-autopairs").setup {} end
	-- }
	 use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

end)


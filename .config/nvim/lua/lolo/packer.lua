-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		-- or branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})
	use { "ellisonleao/gruvbox.nvim" }
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' }
	use { 'neovim/nvim-lspconfig' }
	use {
		'hrsh7th/nvim-cmp',
		require('cmp').setup({
			sources = {
				{ name = 'buffer' },
			},
		})
	}
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use {'mfussenegger/nvim-jdtls' }
end)


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use("wbthomason/packer.nvim")

	use({
	  "nvim-telescope/telescope.nvim",
	  tag = "0.1.8",
	  requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("catppuccin/nvim")

	use({
	  "nvim-treesitter/nvim-treesitter",
      branch = "main",
	  run = ":TSUpdate",
	})

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")

	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
	})
end)

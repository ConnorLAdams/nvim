-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use('nvim-lua/popup.nvim')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-telescope/telescope-media-files.nvim')

  use { 
	  'savq/melange-nvim',
	  as = 'melange',
	  config = function()
		  vim.cmd('colorscheme melange')
	  end
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-lua/plenary.nvim')  -- " don't forget to add this one if you don't have it yet!
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use(
  	{
		'VonHeikemen/lsp-zero.nvim', 
		branch = 'v4.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
		}
	}
)
use({"williamboman/mason.nvim"})
use({"williamboman/mason-lspconfig.nvim", after="mason.nvim"})
use({"neovim/nvim-lspconfig", after="mason-lspconfig.nvim"}) -- enable LSP
use({'hrsh7th/nvim-cmp'})
use({'hrsh7th/cmp-nvim-lsp'})
use({'kovetskiy/neovim-move'})
end)

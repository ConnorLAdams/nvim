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
  use({
        'ThePrimeagen/harpoon',
        branch= 'harpoon2',
        requires = { {"nvim-lua/plenary.nvim"} }
    })

  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use({
		'VonHeikemen/lsp-zero.nvim', 
		branch = 'v4.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
        }
	})
    use({"williamboman/mason.nvim"})
    use({"williamboman/mason-lspconfig.nvim", after="mason.nvim"})
    use({"neovim/nvim-lspconfig", after="mason-lspconfig.nvim"}) -- enable LSP
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})

    use({'mfussenegger/nvim-dap'})
    use({'mfussenegger/nvim-dap-python'})
    use({
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_output_win_max_height = 12
        end,
    })
    use(
        {
            "quarto-dev/quarto-nvim",
            requires = {
                {"jmbuhr/otter.nvim"},
                {"nvim-treesitter/nvim-treesitter"},
            }
        }
    )
    use(
        {
            "GCBallesteros/jupytext.nvim",
           -- config = true,
        }
    )
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use({
        "iamcco/markdown-preview.nvim", 
        run = "cd app && npm install", 
        setup = function() 
            vim.g.mkdp_filetypes = { "markdown" } 
        end, 
        ft = { "markdown" }, 
    })

end)

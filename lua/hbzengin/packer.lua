-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use { "catppuccin/nvim", as = "catppuccin" }
    use 'Mofiqul/vscode.nvim'
    use 'rose-pine/neovim'
    use 'p00f/alabaster.nvim'

    -- No longer using these!
    -- use {"adisen99/apprentice.nvim", requires = {"rktjmp/lush.nvim"}}
    -- use 'Mofiqul/dracula.nvim'
    -- use 'folke/tokyonight.nvim'
    -- use 'sjl/badwolf'
    -- use 'romainl/Apprentice'
    -- use 'altercation/solarized'
    -- use { "svermeulen/text-to-colorscheme.nvim" }
    -- use 'morhetz/gruvbox'
    -- use 'jacoborus/tender.vim'
    -- use 'nordtheme/nord'
    -- use 'rebelot/kanagawa.nvim'
    -- use { 'navarasu/onedark.nvim', as = "onedark" }
    -- use 'EdenEast/nightfox.nvim'

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    }


	use 'mbbill/undotree'
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	}

end)

-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup {
	function(use)
		-- Packer
		use 'wbthomason/packer.nvim'
		-- Indentation helpers
		use {
			{
				'lukas-reineke/indent-blankline.nvim',
				config = [[require('configs.indent-blankline')]],
			},
			{
				'p00f/nvim-ts-rainbow',
				requires = { 'nvim-treesitter/nvim-treesitter' },
				config = [[require('configs.treesitter')]],
			},
		}
		-- Fuzzy search
		use {
			{
				'nvim-telescope/telescope.nvim',
				requires = {
					'nvim-lua/plenary.nvim',
					'telescope-frecency.nvim',
					'telescope-fzf-native.nvim',
				},
				config = [[require('configs.telescope')]],
			},
			{
				'nvim-telescope/telescope-frecency.nvim',
				after = 'telescope.nvim',
				requires = {
					'tami5/sqlite.lua',
					'kyazdani42/nvim-web-devicons',
				},
			},
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make',
			},
		}
		-- Git
		use {
			'tpope/vim-fugitive',
			{
				'lewis6991/gitsigns.nvim',
				requires = { 'nvim-lua/plenary.nvim' },
				config = [[require('configs.gitsigns')]],
			},
			{
				'sindrets/diffview.nvim',
				config = [[require('configs.diffview')]],
			},
		}
		-- Symbols
		use 'kyazdani42/nvim-web-devicons'
		-- Completion and linting
		use {
			'onsails/lspkind-nvim',
			{
				'neovim/nvim-lspconfig',
				config = [[require('configs.lspconfig')]],
			},
			'williamboman/nvim-lsp-installer',
			{
				'jose-elias-alvarez/nvim-lsp-ts-utils',
				requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'jose-elias-alvarez/null-ls.nvim' },
			},
			{
				'jose-elias-alvarez/null-ls.nvim',
				config = [[require('configs.lspconfig.null-ls')]],
				requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
			},
			{
				'hrsh7th/nvim-cmp',
				requires = {
					'neovim/nvim-lspconfig',
					'hrsh7th/cmp-nvim-lsp',
					'hrsh7th/cmp-buffer',
					'hrsh7th/cmp-path',
					'hrsh7th/cmp-cmdline',
					'saadparwaiz1/cmp_luasnip',
					{
						'L3MON4D3/LuaSnip',
						config = [[require('configs.luasnip')]],
						requires = { 'rafamadriz/friendly-snippets' },
					},
				},
				config = [[require('configs.cmp')]],
			},
			'github/copilot.vim',
		}
		-- Highlighting
		use {
			{
				'nvim-treesitter/nvim-treesitter',
				config = [[require('configs.treesitter')]],
				run = ':TSUpdate',
			},
			'nvim-treesitter/playground',
		}
		use {
			'plasticboy/vim-markdown',
			requires = 'godlygeek/tabular',
			setup = [[require('configs.markdown')]],
		}
		-- Cursor line
		use 'yamatsum/nvim-cursorline'
		-- Diagnostics
		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[require('configs.trouble')]],
		}
		-- Sidebar
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[require('configs.tree')]],
		}
		-- Terminal
		use {
			'akinsho/toggleterm.nvim',
			config = [[require('configs.toggleterm')]],
		}
		-- Statusline
		use {
			'famiu/feline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[require('configs.feline')]],
		}
		-- Buffer management
		use {
			'romgrk/barbar.nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = [[require('configs.barbar')]],
		}
		-- WhichKey
		use {
			'folke/which-key.nvim',
			config = [[require('configs.which-key')]],
		}
		-- Scrolling
		use {
			'karb94/neoscroll.nvim',
			config = [[require('configs.neoscroll')]],
		}
		-- Auto pairing and tagging
		use {
			{
				'windwp/nvim-autopairs',
				config = [[require('configs.autopairs')]],
				after = 'nvim-cmp',
			},
			{
				'windwp/nvim-ts-autotag',
				config = [[require('configs.ts-autotag')]],
			},
		}
		-- Surround
		use 'tpope/vim-surround'
		-- Motion
		use { 'ggandor/lightspeed.nvim', requires = 'tpope/vim-repeat' } -- Zen mode
		use {
			'Pocco81/TrueZen.nvim',
			config = [[require('configs.truezen')]],
		}
		-- Commenting
		use 'b3nj5m1n/kommentary'
		-- Color highlighting
		use {
			'norcalli/nvim-colorizer.lua',
			config = [[require('configs.colorizer')]],
		}
		use {
			'nvim-neorg/neorg',
			requires = 'nvim-lua/plenary.nvim',
			config = [[require('configs.neorg')]],
			after = 'nvim-treesitter',
		}
		-- Color schemes
		use {
			'Pocco81/Catppuccino.nvim',
			config = [[require('configs.colorschemes.catppuccino')]],
		}
		use 'bluz71/vim-nightfly-guicolors'

		use {
			'folke/tokyonight.nvim',
			-- config = [[require('configs.colorschemes.tokyonight')]],
		}
		use 'sainnhe/sonokai'
		use 'shaunsingh/nord.nvim'
		use 'navarasu/onedark.nvim'
		use 'sainnhe/everforest'
		use 'EdenEast/nightfox.nvim'
		use {
			'mcchrish/zenbones.nvim',
			requires = 'rktjmp/lush.nvim',
		}
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
	},
}

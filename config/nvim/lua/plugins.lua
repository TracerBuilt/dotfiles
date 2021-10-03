-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
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
		'kabouzeid/nvim-lspinstall',
		{
			'hrsh7th/nvim-cmp',
			requires = {
				{
					'L3MON4D3/LuaSnip',
					config = [[require('configs.luasnip')]],
				},
				'hrsh7th/cmp-nvim-lsp',
				{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
				{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
				'rafamadriz/friendly-snippets',
			},
			config = [[require('configs.cmp')]],
		},
		{
			'RishabhRD/nvim-lsputils',
			requires = 'RishabhRD/popfix',
			config = [[require('configs.lsputils')]],
		},
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
	-- Diagnostics
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = [[require('configs.trouble')]],
	}
	-- Color schemes
	use {
		'Pocco81/Catppuccino.nvim',
		config = [[require('configs.catppuccino')]],
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
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = [[require('configs.lualine')]],
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
	-- Color highlighting
	use {
		'norcalli/nvim-colorizer.lua',
		config = [[require('configs.colorizer')]],
	}
	-- Auto pairing and tagging
	use {
		{
			'windwp/nvim-autopairs',
			config = [[require('configs.autopairs')]],
		},
		{
			'windwp/nvim-ts-autotag',
			config = [[require('configs.ts-autotag')]],
		},
	}
	-- Spelling
	use {
		'lewis6991/spellsitter.nvim',
		config = [[require('configs.spellsitter')]],
	}
	-- Surround
	use 'tpope/vim-surround'
	-- Cheatsheet
	use 'sudormrfbin/cheatsheet.nvim'
	-- Motion
	use 'ggandor/lightspeed.nvim'
	-- Zen mode
	use {
		'Pocco81/TrueZen.nvim',
		config = [[require('configs.truezen')]],
	}
end)

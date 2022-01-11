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
			'lukas-reineke/indent-blankline.nvim',
			config = [[require('configs.indent-blankline')]],
		}
		-- Fuzzy search
		use {
			{
				'nvim-telescope/telescope.nvim',
				requires = {
					'nvim-lua/plenary.nvim',
					'nvim-telescope/telescope-fzf-native.nvim',
				},
				config = [[require('configs.telescope')]],
			},
			{
				'nvim-telescope/telescope-frecency.nvim',
				after = 'telescope.nvim',
				requires = 'tami5/sqlite.lua',
				config = function()
					require('telescope').load_extension 'frecency'
				end,
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
		-- LSP
		use {
			'onsails/lspkind-nvim',
			{
				'neovim/nvim-lspconfig',
				config = [[require('configs.lspconfig')]],
			},
			'williamboman/nvim-lsp-installer',
			{
				'jose-elias-alvarez/null-ls.nvim',
				requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
			},
			'jose-elias-alvarez/nvim-lsp-ts-utils',
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
			'ray-x/lsp_signature.nvim',
			'github/copilot.vim',
		}
		-- Code Actions
		use {
			'kosayoda/nvim-lightbulb',
			config = [[require('configs.lightbulb')]],
		}
		-- Highlighting
		use {
			{
				'nvim-treesitter/nvim-treesitter',
				config = [[require('configs.treesitter')]],
				requires = { 'p00f/nvim-ts-rainbow' },
				run = ':TSUpdate',
			},
			'nvim-treesitter/playground',
		}
		use {
			'plasticboy/vim-markdown',
			requires = 'godlygeek/tabular',
			setup = [[require('configs.markdown')]],
		}
		-- Registers
		use {
			'AckslD/nvim-neoclip.lua',
			requires = {
				{ 'tami5/sqlite.lua', module = 'sqlite' },
				'nvim-telescope/telescope.nvim',
			},
			config = [[require('configs.neoclip')]],
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
			requires = { 'kyazdani42/nvim-web-devicons' },
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
		-- Notifications
		use {
			'rcarriga/nvim-notify',
			config = [[require('configs.notify')]],
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
		-- Repeatable commands
		use 'tpope/vim-repeat'
		-- Motions
		use 'ggandor/lightspeed.nvim'
		-- Zen mode
		use {
			'folke/zen-mode.nvim',
			requires = 'folke/twilight.nvim',
			config = [[require('configs.zen-mode')]],
		}
		-- Commenting
		use 'b3nj5m1n/kommentary'
		-- Color highlighting
		use {
			'norcalli/nvim-colorizer.lua',
			config = [[require('configs.colorizer')]],
		}
		-- Debugging
		use {
			{
				'mfussenegger/nvim-dap',
				config = [[require('configs.dap')]],
			},
			{
				'rcarriga/nvim-dap-ui',
				config = [[require('configs.dap-ui')]],
			},
		}

		-- Color schemes
		-- use {
		-- 'catppuccin/nvim',
		-- config = [[require('configs.colorschemes.catppuccin')]],
		-- }
		-- use 'bluz71/vim-nightfly-guicolors'
		use {
			'bluz71/vim-moonfly-colors',
			config = [[require('configs.colorschemes.moonfly')]],
		}
		-- use {
		-- 'folke/tokyonight.nvim',
		-- config = [[require('configs.colorschemes.tokyonight')]],
		-- }
		-- use {
		-- 'sainnhe/sonokai',
		-- config = [[require('configs.colorschemes.sonokai')]],
		-- }
		-- use 'shaunsingh/nord.nvim'
		-- use {
		-- 'navarasu/onedark.nvim',
		-- config = [[require('configs.colorschemes.onedark')]],
		-- }
		-- use 'sainnhe/everforest'
		-- use 'EdenEast/nightfox.nvim'
		-- use 'pineapplegiant/spaceduck'
		-- use {
		-- 'mcchrish/zenbones.nvim',
		-- requires = 'rktjmp/lush.nvim',
		-- }
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

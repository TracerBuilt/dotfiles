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
			config = [[require('plugins.indent-blankline')]],
		}
		-- Fuzzy search
		use {
			{
				'nvim-telescope/telescope.nvim',
				requires = {
					'nvim-lua/plenary.nvim',
					'nvim-telescope/telescope-fzf-native.nvim',
				},
				config = [[require('plugins.telescope')]],
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
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
			config = [[require('plugins.gitsigns')]],
		}
		-- Symbols
		use 'kyazdani42/nvim-web-devicons'
		-- LSP
		use {
			{
				'neovim/nvim-lspconfig',
				config = [[require('plugins.lspconfig')]],
				requires = {
					{
						'hrsh7th/nvim-cmp',
						config = [[require('plugins.cmp')]],
					},
					'neovim/nvim-lspconfig',
					'onsails/lspkind-nvim',
					'hrsh7th/cmp-nvim-lsp',
					'hrsh7th/cmp-buffer',
					'hrsh7th/cmp-path',
					'hrsh7th/cmp-cmdline',
					'saadparwaiz1/cmp_luasnip',
					{
						'L3MON4D3/LuaSnip',
						config = [[require('plugins.luasnip')]],
						requires = { 'rafamadriz/friendly-snippets' },
					},
				},
			},
			{
				'jose-elias-alvarez/null-ls.nvim',
				requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
			},
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		}
		-- Highlighting
		use {
			'nvim-treesitter/nvim-treesitter-context',
			requires = {
				{
					'nvim-treesitter/nvim-treesitter',
					config = [[require('plugins.treesitter')]],
					requires = { 'p00f/nvim-ts-rainbow' },
					run = ':TSUpdate',
				},
			},
			config = [[require('plugins.treesitter-context')]],
		}
		-- Diagnostics
		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = [[require('plugins.trouble')]],
		}
		-- Sidebar
		use {
			'kyazdani42/nvim-tree.lua',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = [[require('plugins.tree')]],
		}
		-- Terminal
		use {
			'akinsho/toggleterm.nvim',
			config = [[require('plugins.toggleterm')]],
		}
		-- Statusline
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = [[require('plugins.lualine')]],
		}
		-- Buffer management
		use {
			'akinsho/bufferline.nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = [[require('plugins.bufferline')]],
		}
		-- Notifications
		use {
			'rcarriga/nvim-notify',
			config = [[require('plugins.notify')]],
		}
		-- WhichKey
		use {
			'folke/which-key.nvim',
			config = [[require('plugins.which-key')]],
		}
		-- Scrolling
		use {
			'karb94/neoscroll.nvim',
			config = [[require('plugins.neoscroll')]],
		}
		-- Auto pairing
		use {
			'windwp/nvim-autopairs',
			config = [[require('plugins.autopairs')]],
			after = 'nvim-cmp',
		}
		-- Extra Rust tools
		use {
			'simrat39/rust-tools.nvim',
			config = [[require('rust-tools').setup({})]],
		}
		-- Surround
		use {
			'kylechui/nvim-surround',
			config = [[require('nvim-surround').setup({})]],
		}
		-- Repeatable commands
		use 'tpope/vim-repeat'
		-- Motions
		use 'ggandor/leap.nvim'
		-- Commenting
		use {
			'numToStr/Comment.nvim',
			config = [[require('Comment').setup()]],
		}
		-- Color highlighting
		use {
			'norcalli/nvim-colorizer.lua',
			config = [[require('plugins.colorizer')]],
		}
		-- Illuminate word under cursor
		use 'RRethy/vim-illuminate'
		-- Debugging
		use {
			{
				'mfussenegger/nvim-dap',
				config = [[require('plugins.dap')]],
			},
			{
				'rcarriga/nvim-dap-ui',
				config = [[require('plugins.dap-ui')]],
			},
		}
		-- Window management
		use {
			'beauwilliams/focus.nvim',
			config = [[require('plugins.focus')]],
		}
		-- Fancy selects
		use {
			'stevearc/dressing.nvim',
			config = [[require('plugins.dressing')]],
		}
		use {
			'rebelot/kanagawa.nvim',
			config = [[require('plugins.colorschemes.kanagawa')]],
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

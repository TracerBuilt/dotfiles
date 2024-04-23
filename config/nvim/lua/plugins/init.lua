-- Bootstrap packer
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:one',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup {
	-- LSP

	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{
		'neovim/nvim-lspconfig',
		config = function()
			require 'plugins.lspconfig'
		end,
	},
	{
		'j-hui/fidget.nvim',
		config = function()
			require 'plugins.fidget'
		end,
		opts = {},
	},

	-- Formatting
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			require 'plugins.conform'
		end,
	},

	-- Autocomplete
	{
		'hrsh7th/nvim-cmp',
		config = function()
			require 'plugins.cmp'
		end,
	},
	'neovim/nvim-lspconfig',
	'onsails/lspkind-nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'petertriho/cmp-git',
	'saadparwaiz1/cmp_luasnip',
	{
		'L3MON4D3/LuaSnip',
		version = 'v2.*',
		build = 'make install_jsregexp',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
	'rafamadriz/friendly-snippets',
	{
		'Exafunction/codeium.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'hrsh7th/nvim-cmp',
		},
		config = function()
			require('codeium').setup {}
		end,
	},

	-- Highlighting
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require 'plugins.treesitter-context'
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require 'plugins.treesitter'
		end,
		build = ':TSUpdate',
	},

	{
		'HiPhish/rainbow-delimiters.nvim',
		config = function()
			require 'plugins.rainbow-delimiters'
		end,
	},

	{
		'nvimdev/hlsearch.nvim',
		event = 'BufRead',
		config = function()
			require('hlsearch').setup()
		end,
	},

	-- Auto-tagging
	'windwp/nvim-ts-autotag',

	-- Fuzzy search
	{
		'nvim-telescope/telescope.nvim',
		config = function()
			require 'plugins.telescope'
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},

	-- Git
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require 'plugins.gitsigns'
		end,
	},
	-- Diagnostics
	{
		'folke/trouble.nvim',
		config = function()
			require 'plugins.trouble'
		end,
	},
	-- Sidebar
	{
		'antosha417/nvim-lsp-file-operations',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-tree/nvim-tree.lua',
				version = '*',
				lazy = false,
				dependencies = {
					'nvim-tree/nvim-web-devicons',
				},
				config = function()
					require 'plugins.tree'
				end,
			},
		},
		config = function()
			require('lsp-file-operations').setup()
		end,
	},
	-- Terminal
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = function()
			require 'plugins.toggleterm'
		end,
	},
	-- Statusline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'plugins.lualine'
		end,
	},
	-- Buffer management
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require 'plugins.bufferline'
		end,
	},
	-- WhichKey
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	-- Scrolling
	{
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup {}
		end,
	},
	-- Auto pairing
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
		opts = {
			check_ts = true,
		},
	},
	-- Surround
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup()
		end,
	},
	-- Repeatable commands
	'tpope/vim-repeat',
	-- Motions
	'ggandor/leap.nvim',
	-- Commenting
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	},
	-- Color highlighting
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require 'plugins.colorizer'
		end,
	},
	-- Debugging
	--

	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
		config = function()
			require 'plugins.dap-ui'
		end,
	},

	-- Window management
	{
		'beauwilliams/focus.nvim',
		config = function()
			require 'plugins.focus'
		end,
	},
	-- Fancy selects
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		'rebelot/kanagawa.nvim',
		config = function()
			require 'plugins.colorschemes.kanagawa'
		end,
	},
	-- Indentation helpers
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
		config = function()
			require 'plugins.indent-blankline'
		end,
	},
}

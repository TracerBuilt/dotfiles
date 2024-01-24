-- Bootstrap packer
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup {
	-- LSP
	{
		'neovim/nvim-lspconfig',
		config = function()
			require 'plugins.lspconfig'
		end,
	},
	'nvimtools/none-ls.nvim',
	'nvim-lua/plenary.nvim',
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{
		'j-hui/fidget.nvim',
		config = function()
			require 'plugins.fidget'
		end,
		opts = {},
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
	'saadparwaiz1/cmp_luasnip',
	{
		'L3MON4D3/LuaSnip',
		version = 'v2.*',
		build = 'make install_jsregexp',
	},
	'rafamadriz/friendly-snippets',
	'Exafunction/codeium.vim',

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
	'p00f/nvim-ts-rainbow',

	-- Fuzzy search
	'nvim-treesitter/nvim-treesitter-textobjects',
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		config = function()
			require 'plugins.telescope'
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		config = function()
			require('telescope').load_extension 'fzf'
		end,
	},

	-- Git
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require 'plugins.gitsigns'
		end,
	},
	-- Symbols
	'kyazdani42/nvim-web-devicons',
	-- Diagnostics
	{
		'folke/trouble.nvim',
		config = function()
			require 'plugins.trouble'
		end,
	},
	-- Sidebar
	{
		'kyazdani42/nvim-tree.lua',
		config = function()
			require 'plugins.tree'
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
		config = function()
			require 'plugins.lualine'
		end,
	},
	-- Buffer management
	{
		'akinsho/bufferline.nvim',
		config = function()
			require 'plugins.bufferline'
		end,
	},
	-- WhichKey
	{
		'folke/which-key.nvim',
		config = function()
			require 'plugins.which-key'
		end,
	},
	-- Scrolling
	{
		'karb94/neoscroll.nvim',
		config = function()
			require 'plugins.neoscroll'
		end,
	},
	-- Auto pairing
	{
		'windwp/nvim-autopairs',
		config = function()
			require 'plugins.autopairs'
		end,
	},
	-- Extra Rust tools
	{
		'simrat39/rust-tools.nvim',
		config = function()
			require('rust-tools').setup()
		end,
	},
	-- Surround
	{
		'kylechui/nvim-surround',
		version = '*',
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
	-- Illuminate word under cursor
	'RRethy/vim-illuminate',
	-- Debugging
	{
		'mfussenegger/nvim-dap',
		config = function()
			require 'plugins.dap'
		end,
	},
	{
		'rcarriga/nvim-dap-ui',
		config = function()
			require('dapui').setup()
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
		config = function()
			require 'plugins.dressing'
		end,
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

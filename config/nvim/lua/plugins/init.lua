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
		-- LSP
		use {
			'neovim/nvim-lspconfig',
			config = function()
				require 'plugins.lspconfig'
			end,
			requires = {
				{
					'jose-elias-alvarez/null-ls.nvim',
					requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
				},
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',
				'j-hui/fidget.nvim',
			},
		}

		-- Autocomplete
		use {
			'hrsh7th/nvim-cmp',
			config = function()
				require 'plugins.cmp'
			end,
			requires = {
				'neovim/nvim-lspconfig',
				'onsails/lspkind-nvim',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'saadparwaiz1/cmp_luasnip',
				{
					'L3MON4D3/LuaSnip',
					tag = 'v1.*',
					run = 'make install_jsregexp',
					requires = { 'rafamadriz/friendly-snippets' },
				},
			},
		}

		use 'Exafunction/codeium.vim'
		-- Highlighting
		use {
			'nvim-treesitter/nvim-treesitter-context',
			requires = {
				{
					'nvim-treesitter/nvim-treesitter',
					config = function()
						require 'plugins.treesitter'
					end,
					requires = { 'p00f/nvim-ts-rainbow' },
					run = function()
						pcall(require('nvim-treesitter.install').update { with_sync = true })
					end,
				},
			},
			config = function()
				require 'plugins.treesitter-context'
			end,
		}

		use {
			'nvim-treesitter/nvim-treesitter-textobjects',
			after = 'nvim-treesitter',
		}

		-- Fuzzy search
		use {
			{
				'nvim-telescope/telescope.nvim',
				requires = {
					'nvim-lua/plenary.nvim',
				},
				config = function()
					require 'plugins.telescope'
				end,
			},
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make',
				cond = vim.fn.executable 'make' == 1,
				config = function()
					pcall(require('telescope').load_extension 'fzf')
				end,
			},
		}
		-- Git
		use {
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
			config = function()
				require 'plugins.gitsigns'
			end,
		}
		-- Symbols
		use 'kyazdani42/nvim-web-devicons'
		-- Diagnostics
		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require 'plugins.trouble'
			end,
		}
		-- Sidebar
		use {
			'kyazdani42/nvim-tree.lua',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function()
				require 'plugins.tree'
			end,
		}
		-- Terminal
		use {
			'akinsho/toggleterm.nvim',
			config = function()
				require 'plugins.toggleterm'
			end,
		}
		-- Statusline
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require 'plugins.lualine'
			end,
		}
		-- Buffer management
		use {
			'akinsho/bufferline.nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function()
				require 'plugins.bufferline'
			end,
		}
		-- WhichKey
		use {
			'folke/which-key.nvim',
			config = function()
				require 'plugins.which-key'
			end,
		}
		-- Scrolling
		use {
			'karb94/neoscroll.nvim',
			config = function()
				require 'plugins.neoscroll'
			end,
		}
		-- Auto pairing
		use {
			'windwp/nvim-autopairs',
			config = function()
				require 'plugins.autopairs'
			end,
			after = 'nvim-cmp',
		}
		-- Extra Rust tools
		use {
			'simrat39/rust-tools.nvim',
			config = function()
				require('rust-tools').setup {}
			end,
		}
		-- Surround
		use {
			'kylechui/nvim-surround',
			tag = '*',
			config = function()
				require('nvim-surround').setup {}
			end,
		}
		-- Repeatable commands
		use 'tpope/vim-repeat'
		-- Motions
		use 'ggandor/leap.nvim'
		-- Commenting
		use {
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end,
		}
		-- Color highlighting
		use {
			'norcalli/nvim-colorizer.lua',
			config = function()
				require 'plugins.colorizer'
			end,
		}
		-- Illuminate word under cursor
		use 'RRethy/vim-illuminate'
		-- Debugging
		use {
			'rcarriga/nvim-dap-ui',
			requires = {
				'mfussenegger/nvim-dap',
				config = function()
					require 'plugins.dap'
				end,
			},
			config = function()
				require('dapui').setup()
			end,
		}
		-- Window management
		use {
			'beauwilliams/focus.nvim',
			config = function()
				require 'plugins.focus'
			end,
		}
		-- Fancy selects
		use {
			'stevearc/dressing.nvim',
			config = function()
				require 'plugins.dressing'
			end,
		}
		use {
			'rebelot/kanagawa.nvim',
			config = function()
				require 'plugins.colorschemes.kanagawa'
			end,
		}
		-- Indentation helpers
		use {
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require 'plugins.indent-blankline'
			end,
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

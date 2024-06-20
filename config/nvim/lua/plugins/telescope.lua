return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	},
	config = function()
		local telescope = require 'telescope'
		telescope.setup {
			defaults = {
				layout_strategy = 'flex',
				scroll_strategy = 'cycle',
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = 'smart_case',
				},
				media_files = {},
			},
			pickers = {
				lsp_references = { theme = 'cursor' },
				lsp_definition = { theme = 'cursor' },
				lsp_impl_definition = { theme = 'cursor' },
				buffers = {
					sort_lastused = true,
				},
			},
		}

		telescope.load_extension 'fzf'

		local wk = require 'which-key'

		wk.register {
			['<leader>f'] = {
				name = 'File',
				f = { require('telescope.builtin').find_files, 'Find Files' },
				g = { require('telescope.builtin').live_grep, 'Live Grep' },
				b = { require('telescope.builtin').buffers, 'Find Buffers' },
				h = { require('telescope.builtin').help_tags, 'Help Tags' },
				o = { require('telescope.builtin').vim_options, 'Vim Options' },
				t = { require('telescope.builtin').treesitter, 'Treesitter Symbols' },
				c = { require('telescope.builtin').colorscheme, 'Color Schemes' },
				i = { require('telescope.builtin').highlights, 'Color Schemes' },

				G = {
					name = 'Git',
					c = { require('telescope.builtin').git_commits, 'List All Commits' },
					C = { require('telescope.builtin').git_bcommits, 'List Buffer Commits' },
					b = { require('telescope.builtin').git_branches, 'List Branches' },
					s = { require('telescope.builtin').git_status, 'List Current Changes' },
					S = { require('telescope.builtin').git_stash, 'List Stash Items' },
				},
			},
		}
	end,
}

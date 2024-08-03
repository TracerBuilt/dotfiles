return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
		'folke/noice.nvim',
		'folke/flash.nvim',
		'gbprod/yanky.nvim',
	},
	ops = function(_, opts)
		local function flash(prompt_bufnr)
			require('flash').jump {
				pattern = '^',
				label = { after = { 0, 0 } },
				search = {
					mode = 'search',
					exclude = {
						function(win)
							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
						end,
					},
				},
				action = function(match)
					local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
					picker:set_selection(match.pos[1] - 1)
				end,
			}
		end
		opts = vim.tbl_deep_extend('force', opts or {}, {
			defaults = {
				mappings = {
					n = { s = flash },
					i = { ['<c-s>'] = flash },
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = 'smart_case',
				},
			},
		})
	end,
	config = function()
		local telescope = require 'telescope'

		telescope.load_extension 'fzf'
		telescope.load_extension 'noice'
		telescope.load_extension 'yank_history'

		local wk = require 'which-key'

		wk.register {
			['<leader>'] = {
				f = {
					name = '+file',
					f = { require('telescope.builtin').find_files, 'Find Files' },
					g = { require('telescope.builtin').live_grep, 'Live Grep' },
					b = { require('telescope.builtin').buffers, 'Find Buffers' },
					h = { require('telescope.builtin').help_tags, 'Help Tags' },
					o = { require('telescope.builtin').vim_options, 'Vim Options' },
					t = { require('telescope.builtin').treesitter, 'Treesitter Symbols' },
					c = { require('telescope.builtin').colorscheme, 'Color Schemes' },
					i = { require('telescope.builtin').highlights, 'Color Schemes' },
				},

				g = {
					name = '+git',
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

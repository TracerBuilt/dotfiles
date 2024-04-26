return {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup {
			on_attach = function(bufnr)
				local gitsigns = require 'gitsigns'
				local wk = require 'which-key'

				wk.register {

					-- Navigation
					[']c'] = {
						function()
							if vim.wo.diff then
								vim.cmd.normal { '}c', bang = true }
							else
								gitsigns.nav_hunk 'next'
							end
						end,
						'Next Hunk',
					},
					['[c'] = {
						function()
							if vim.wo.diff then
								vim.cmd.normal { '[c', bang = true }
							else
								gitsigns.nav_hunk 'prev'
							end
						end,
						'Previous Hunk',
					},

					-- Actions
					['<leader>'] = {
						name = 'GitSigns Actions',
						['hs'] = {
							function()
								gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
							end,
							'Stage hunk',
						},
						['hr'] = {
							function()
								gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
							end,
							'Reset hunk',
						},
						mode = 'v',
					},

					['<leader>'] = {
						name = 'GitSigns Actions',
						['hs'] = { gitsigns.stage_hunk, 'Stage hunk' },
						['hr'] = { gitsigns.reset_hunk, 'Reset hunk' },
						['hS'] = { gitsigns.stage_buffer, 'Stage buffer' },
						['hu'] = { gitsigns.undo_stage_hunk, 'Undo stage hunk' },
						['hR'] = { gitsigns.reset_buffer, 'Reset buffer' },
						['hp'] = { gitsigns.preview_hunk, 'Preview hunk' },
						['hb'] = {
							function()
								gitsigns.blame_line { full = true }
							end,
							'Blame line',
						},
						['tb'] = { gitsigns.toggle_current_line_blame, 'Toggle current line blame' },
						['hd'] = { gitsigns.diffthis, 'Diff this' },
						['hD'] = {
							function()
								gitsigns.diffthis '~'
							end,
							'Diff this, but extra',
						},
						['td'] = { gitsigns.toggle_deleted, 'Toggle deleted' },
					},
					ih = { '<C-U>Gitsigns select_hunk<CR>', mode = { 'o', 'x' } },
				}
			end,
		}
	end,
}

dofile(vim.g.base46_cache .. 'term')

return {
	'akinsho/toggleterm.nvim',

	cmd = { 'ToggleTerm' },

	keys = function()
		return {
			{ '<C-/>', desc = 'Toggle terminal' },
			{
				'<leader>gl',
				function()
					local Terminal = require('toggleterm.terminal').Terminal
					local lazygit = Terminal:new {
						cmd = 'lazygit',
						dir = 'git_dir',
						hidden = true,
						direction = 'float',
						on_open = function()
							vim.cmd 'startinsert!'
							vim.keymap.set('n', 'q', '<cmd>close<CR>', { noremap = true, silent = true, buffer = 0 })
						end,
						on_close = function(term)
							vim.cmd 'startinsert!'
						end,
						float_opts = {
							border = 'solid',
							winblend = 30,
						},
					}

					function _lazygit_toggle()
						lazygit:toggle()
					end
					_lazygit_toggle()
				end,
				desc = 'Open lazygit',
			},
		}
	end,

	opts = {
		open_mapping = [[<C-/>]],
		on_open = function(term)
			local opts = { buffer = term.bufnr }
			vim.keymap.set('t', '<esc>', '<C-\\><C-n>', vim.tbl_extend('force', opts, { desc = 'Enter normal mode' }))
			vim.keymap.set(
				't',
				'<C-h>',
				'<Cmd>wincmd h<CR>',
				vim.tbl_extend('force', opts, { desc = 'Go to left window' })
			)
			vim.keymap.set(
				't',
				'<C-j>',
				'<Cmd>wincmd j<CR>',
				vim.tbl_extend('force', opts, { desc = 'Go to lower window' })
			)
			vim.keymap.set(
				't',
				'<C-k>',
				'<Cmd>wincmd k<CR>',
				vim.tbl_extend('force', opts, { desc = 'Go to upper window' })
			)
			vim.keymap.set(
				't',
				'<C-l>',
				'<Cmd>wincmd l<CR>',
				vim.tbl_extend('force', opts, { desc = 'Go to right window' })
			)
			vim.keymap.set(
				{ 'n', 'i', 't' },
				'<C-t>',
				'<cmd>ToggleTermSetName' .. term.id .. '<cr>i',
				vim.tbl_extend('force', opts, { desc = 'Set terminal name' })
			)
		end,

		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_terminals = true,
		shade_factor = '-30',
		shading_ratio = '3',
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		direction = 'horizontal',
		winbar = {
			enabled = true,
			name_formatter = function(term)
				return string.format('%d: %s', term.id, term:_display_name())
			end,
		},
	},
}

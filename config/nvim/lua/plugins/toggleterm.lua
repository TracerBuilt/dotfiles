return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup {

			open_mapping = [[<c-\>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			on_open = function(term)
				local opts = { buffer = term.bufnr }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end,
			persist_size = true,
			direction = 'horizontal',
		}

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
		}
		function _lazygit_toggle()
			lazygit:toggle()
		end

		local wk = require 'which-key'

		wk.register({
			['<leader>g'] = {
				name = '+git',
				l = { '<cmd>lua _lazygit_toggle()<CR>', 'Open Lazygit' },
			},
		}, { noremap = true, silent = true })
	end,
}

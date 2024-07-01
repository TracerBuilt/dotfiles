return {
	'akinsho/toggleterm.nvim',

	cmd = { 'ToggleTerm' },
	keys = function()
		local wk = require 'which-key'
		wk.register {
			['<leader>T'] = { name = '+terminal' },
		}
		return {
			{ '<C-/>' },
			{
				'<leader>Tf',
				function()
					local count = vim.v.count1
					require('toggleterm').toggle(count, 0, LazyVim.root.get(), 'float')
				end,
				desc = 'Open float (root_dir)',
			},
			{
				'<leader>Th',
				function()
					local count = vim.v.count1
					require('toggleterm').toggle(count, 15, LazyVim.root.get(), 'horizontal')
				end,
				desc = 'Open horizontal (root_dir)',
			},
			{
				'<leader>Tv',
				function()
					local count = vim.v.count1
					require('toggleterm').toggle(
						count,
						vim.o.columns * 0.4,
						LazyVim.root.get(),
						'vertical'
					)
				end,
				desc = 'Open vertical (root_dir)',
			},
			{
				'<leader>Ts',
				'<cmd>TermSelect<cr>',
				desc = 'Select terminal',
			},
			{
				'<leader>Tt',
				function()
					require('toggleterm').toggle(1, 100, LazyVim.root.get(), 'tab')
				end,
				desc = 'Open tab (root_dir)',
			},
			{
				'<leader>TT',
				function()
					require('toggleterm').toggle(1, 100, vim.loop.cwd(), 'tab')
				end,
				desc = 'Open tab (cwd_dir)',
			},
		}
	end,

	opts = {
		open_mapping = [[<c-/>]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		on_open = function(term)
			local opts = { buffer = term.bufnr }
			vim.keymap.set(
				't',
				'<esc>',
				'<C-\\><C-n>',
				vim.tbl_extend('force', opts, { desc = 'Enter normal mode' })
			)
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

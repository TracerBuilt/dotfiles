return {
	'nvim-focus/focus.nvim',
	version = '*',
	config = function()
		require('focus').setup {}

		local ignore_filetypes = { 'NvimTree', 'toggleterm' }
		local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

		local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

		vim.api.nvim_create_autocmd('WinEnter', {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
					vim.w.focus_disable = true
				else
					vim.w.focus_disable = false
				end
			end,
			desc = 'Disable focus autoresize for BufType',
		})

		vim.api.nvim_create_autocmd('FileType', {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.focus_disable = true
				else
					vim.b.focus_disable = false
				end
			end,
			desc = 'Disable focus autoresize for FileType',
		})

		local wk = require 'which-key'

		wk.register {
			['<c-l>'] = { '<cmd>FocusSplitNicely<CR>', 'Focus Split Nicely' },
			['<leader>'] = {
				h = { '<cmd>FocusSplitLeft<CR>', 'Focus Split Left' },
				j = { '<cmd>FocusSplitDown<CR>', 'Focus Split Down' },
				k = { '<cmd>FocusSplitUp<CR>', 'Focus Split Up' },
				l = { '<cmd>FocusSplitRight<CR>', 'Focus Split Right' },
			},
		}
	end,
}

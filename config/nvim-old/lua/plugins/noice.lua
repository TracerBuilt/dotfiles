return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		-- add any options here
	},
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
	},
	config = function()
		require('noice').setup {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		}

		local wk = require 'which-key'

		wk.register({
			name = '+messages',
			['<leader>m'] = {
				h = { '<cmd>Noice<CR>', 'Message History' },
				l = { '<cmd>Noice last<CR>', 'Last Message' },
				q = { '<cmd>Noice dismiss<CR>', 'Dismiss Visible Messages' },
				x = { '<cmd>Noice errors<CR>', 'Error Messages' },
				d = { '<cmd>Noice disable<CR>', 'Disable Noice' },
				e = { '<cmd>Noice enable<CR>', 'Enable Noice' },
				s = { '<cmd>Noice stats<CR>', 'Debugging Stats' },
				t = { '<cmd>Noice telescope<CR>', 'Message History - Telescope' },
			},
		}, { mode = 'n' })

		wk.register {
			['<c-f>'] = {
				function()
					if not require('noice.lsp').scroll(4) then
						return '<c-f>'
					end
				end,
				'Scroll Hover Docs Up',
				mode = { 'n', 'i', 's' },
			},
			['<c-b>'] = {
				function()
					if not require('noice.lsp').scroll(-4) then
						return '<c-b>'
					end
				end,
				'Scroll Hover Docs Down',
				mode = { 'n', 'i', 's' },
			},
			{ silent = true, expr = true },
		}
	end,
}

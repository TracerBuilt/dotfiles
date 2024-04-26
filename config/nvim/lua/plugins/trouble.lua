return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		use_diagnostic_signs = true,
	},
	config = function()
		local wk = require 'which-key'
		wk.register {
			['<leader>x'] = {
				name = 'Diagnostics',
				x = { '<cmd>Trouble<CR>', 'Open Diagnostics' },
				w = { '<cmd>Trouble lsp_workspace_diagnostics<CR>', 'Open Workspace Diagnostics' },
				d = { '<cmd>Trouble lsp_document_diagnostics<CR>', 'Open Document Diagnostics' },
				l = { '<cmd>Trouble loclist<CR>', 'Open Location List' },
				q = { '<cmd>Trouble quickfix<CR>', 'Open Quickfix List' },
			},
			gR = { '<cmd>Trouble lsp_references<CR>', 'LSP References' },
		}
	end,
}

return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		local wk = require 'which-key'

		wk.register {
			['<C-n>'] = { '<cmd>Neotree toggle<CR>', 'Toggle File Tree' },
			['<leader>n'] = { '<cmd>Neotree<CR>', 'Focus File Tree' },
		}

		vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
		vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
		vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
		vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

		require('neo-tree').setup {

			window = {
				position = 'right',
			},
			source_selector = {
				winbar = true,
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				use_libuv_file_watcher = true,
			},
			hide_root_node = true,
		}
	end,
}

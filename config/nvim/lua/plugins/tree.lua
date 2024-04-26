return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup {
			diagnostics = {
				enable = true,
			},
			view = {
				side = 'right',
			},
			renderer = {
				highlight_git = true,
				highlight_opened_files = 'icon',
				root_folder_label = false,
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = false,
			},
		}

		local wk = require 'which-key'

		wk.register {
			['<C-n>'] = { '<cmd>NvimTreeToggle<CR>', 'Toggle File Tree' },
			['<leader>n'] = { '<cmd>NvimTreeFocus<CR>', 'Focus File Tree' },
		}
	end,
}

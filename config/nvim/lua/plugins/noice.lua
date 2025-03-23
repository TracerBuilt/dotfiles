return {
	'folke/noice.nvim',
	opts = {
		presets = {
			inc_rename = true,
		},
		lsp = {
			hover = {
				silent = true,
			},
		},
		views = {
			cmdline_popup = {
				border = {
					style = 'solid',
				},
			},
			cmdline_popupmenu = {
				border = {
					style = 'solid',
				},
			},
			hover = {
				border = {
					style = 'solid',
				},
			},
			popup = {
				border = {
					style = 'solid',
				},
			},
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
		routes = {
			{
				filter = {
					event = 'msg_show',
					any = {
						{ find = 'Supermaven Free Tier is running.' },
						{ find = 'Starting Supermaven...' },
					},
				},
				view = 'mini',
			},
			{
				filter = {
					find = 'No LSP client found that supports symbols in buffer',
				},
				opts = { skip = true },
			},
		},
	},
}

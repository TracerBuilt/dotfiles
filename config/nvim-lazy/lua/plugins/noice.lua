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
					padding = { 0, 0 },
				},
			},
			cmdline_popupmenu = {
				border = {
					style = 'solid',
					padding = { 0, 0 },
				},
			},
			hover = {
				size = {
					max_width = 80,
				},
				border = {
					style = 'solid',
					padding = { 0, 1 },
				},
				position = {
					row = 2,
				},
			},
			popup = {
				border = {
					style = 'solid',
					padding = { 0, 0 },
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

	dependencies = {
		{
			'rcarriga/nvim-notify',
			opts = {
				on_open = function(win)
					local config = vim.api.nvim_win_get_config(win)
					config.border = 'solid'
					vim.api.nvim_win_set_config(win, config)
				end,
			},
		},
	},
}

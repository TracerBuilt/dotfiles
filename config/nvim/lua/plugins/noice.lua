return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		lsp = {
			hover = {
				silent = true,
			},
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
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
		'MunifTanjim/nui.nvim',
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

return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	opts = {
		session_dir = vim.fn.stdpath 'data' .. '/sessions/',
		config = {
			header = {
				'',

				' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
				' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
				' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
				' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
				' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
				' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
				' ',
			},
			shortcut = {
				{
					icon = ' ',
					icon_hl = '@variable',
					desc = 'Files',
					group = 'Label',
					action = 'Telescope find_files',
					key = 'f',
				},
				{
					icon = ' ',
					desc = ' New File',
					action = 'ene | startinsert',
					key = 'n',
				},
				{
					icon = ' ',
					desc = 'Config',
					group = 'Number',
					action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config")})',
					key = 'c',
				},
				{ icon = '󰒲 ', desc = 'Lazy', group = '@property', action = 'Lazy', key = 'l' },
				{
					icon = ' ',
					desc = 'Quit',
					action = function()
						vim.api.nvim_input '<cmd>qa<cr>'
					end,
					key = 'q',
				},
			},
		},
	},
}

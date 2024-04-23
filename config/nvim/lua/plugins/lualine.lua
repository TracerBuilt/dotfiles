local theme = require('kanagawa.colors').setup().theme

local kanagawa = {}

kanagawa.normal = {
	a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
	b = { bg = theme.diff.change, fg = theme.syn.fun },
	c = { bg = 'None', fg = theme.ui.fg },
}

kanagawa.insert = {
	a = { bg = theme.diag.ok, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

kanagawa.command = {
	a = { bg = theme.syn.operator, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

kanagawa.visual = {
	a = { bg = theme.syn.keyword, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

kanagawa.replace = {
	a = { bg = theme.syn.constant, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

kanagawa.inactive = {
	a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = 'bold' },
	c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
}

require('lualine').setup {
	options = {
		globalstatus = true,
		theme = kanagawa,
	},
	extensions = { 'fzf', 'lazy', 'mason', 'nvim-tree', 'nvim-dap-ui', 'toggleterm' },
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
}

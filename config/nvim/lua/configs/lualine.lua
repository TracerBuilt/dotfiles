require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'catppuccino',
		component_separators = { '', '' },
		section_separators = { '', '' },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'diff' },
		lualine_x = { 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	tabline = {},
	extensions = { 'nvim-tree' },
}

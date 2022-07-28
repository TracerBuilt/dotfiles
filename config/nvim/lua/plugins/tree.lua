require('nvim-tree').setup {
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = { '.DS_Store' },
	},
	view = {
		hide_root_folder = true,
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = 'icon',
		indent_markers = {
			enable = true,
		},
	},
	git = {
		ignore = false,
	},
}

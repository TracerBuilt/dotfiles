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

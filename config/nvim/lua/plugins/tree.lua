vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1

-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
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
}

vim.g.nvim_tree_ignore = { '.git', '.DS_Store' }
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_window_picker_exclude = {
	filetype = { 'notify', 'packer', 'qf' },
	buftype = { 'terminal' },
}
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
require('nvim-tree').setup {
	view = {
		auto_resize = true,
	},
}

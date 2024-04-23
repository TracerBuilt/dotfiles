require('bufferline').setup {
	options = {
		themable = true,
		diagnostics = 'nvim_lsp',
		separator_style = 'thin',
		hover = {
			enabled = true,
			delay = 0,
			reveal = { 'close' },
		},
		offsets = {
			{
				filetype = 'NvimTree',
				text = function()
					return string.sub(vim.fn.getcwd(), vim.fn.getcwd():match '^.*()/')
				end,
				highlight = 'Directory',
				text_align = 'center',
				separator = true,
			},
		},
	},
}

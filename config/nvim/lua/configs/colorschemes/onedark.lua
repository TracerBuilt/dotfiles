require('onedark').setup {
	style = 'darker',
	transparent = true,

	diagnostics = {
		background = false,
	},
	highlights = {
		IndentBlankline = { fg = '$grey' },
		IndentBlanklineContext = { fg = '$purple' },
		IndentBlanklineContextStart = { sp = '$purple', fmt = 'underline' },
		NormalFloat = { bg = 'NONE' },
		FloatBorder = { fg = '$purple' },
	},
}

require('onedark').load()

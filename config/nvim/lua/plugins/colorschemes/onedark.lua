return {
	'navarasu/onedark.nvim',
	lazy = true,
	config = function()
		require('onedark').setup {
			style = 'darker',
			transparent = true,
			ending_tildes = false,

			diagnostics = {
				background = false,
			},
			highlights = {
				IndentBlankline = { fg = '$grey' },
				IndentBlanklineContext = { fg = '$purple' },
				IndentBlanklineContextStart = { sp = '$purple', fmt = 'underline' },
				NormalFloat = { bg = 'NONE' },
				FloatBorder = { fg = '$purple', bg = 'NONE' },
			},
		}
	end,
}

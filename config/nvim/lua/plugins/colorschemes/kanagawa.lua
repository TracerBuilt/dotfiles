local colors = require('kanagawa.colors').setup()

require('kanagawa').setup {
	globalStatus = true,
	transparent = true,
	undercurl = true,
	overrides = {
		VertSplit = { fg = colors.katanaGray, bg = 'NONE' },
		WinSeparator = { fg = colors.katanaGray, bg = 'NONE' },
		IndentBlankline1 = { fg = colors.oniViolet },
		IndentBlankline2 = { fg = colors.crystalBlue },
		IndentBlankline3 = { fg = colors.sakuraPink },
		IndentBlankline4 = { fg = colors.springGreen },
		IndentBlankline5 = { fg = colors.surimiOrange },
		IndentBlankline6 = { fg = colors.peachRed },
		IndentBlankline7 = { fg = colors.oldWhite},
		IndentBlanklineContextChar = { fg = colors.fujiWhite },
		IndentBlanklineContextStart = { sp = colors.fujiWhite },
		rainbowcol1 = { fg = colors.oniViolet },
		rainbowcol2 = { fg = colors.crystalBlue },
		rainbowcol3 = { fg = colors.sakuraPink },
		rainbowcol4 = { fg = colors.springGreen },
		rainbowcol5 = { fg = colors.surimiOrange },
		rainbowcol6 = { fg = colors.peachRed },
		rainbowcol7 = { fg = colors.oldWhite},
		TreesitterContext = { bg = colors.sumiInk2, sp = colors.fujiWhite }
	},
}

vim.cmd 'colorscheme kanagawa'

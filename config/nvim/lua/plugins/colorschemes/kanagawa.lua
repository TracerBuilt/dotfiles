require('kanagawa').setup {
	globalStatus = true,
	undercurl = true,
	overrides = function(colors)
		return {
			IndentBlankline1 = { fg = colors.palette.oniViolet },
			IndentBlankline2 = { fg = colors.palette.crystalBlue },
			IndentBlankline3 = { fg = colors.palette.sakuraPink },
			IndentBlankline4 = { fg = colors.palette.springGreen },
			IndentBlankline5 = { fg = colors.palette.surimiOrange },
			IndentBlankline6 = { fg = colors.palette.peachRed },
			IndentBlankline7 = { fg = colors.palette.oldWhite },
			IndentBlanklineContextChar = { fg = colors.palette.fujiWhite },
			IndentBlanklineContextStart = { sp = colors.palette.fujiWhite },
			rainbowcol1 = { fg = colors.palette.oniViolet },
			rainbowcol2 = { fg = colors.palette.crystalBlue },
			rainbowcol3 = { fg = colors.palette.sakuraPink },
			rainbowcol4 = { fg = colors.palette.springGreen },
			rainbowcol5 = { fg = colors.palette.surimiOrange },
			rainbowcol6 = { fg = colors.palette.peachRed },
			rainbowcol7 = { fg = colors.palette.oldWhite },
			TreesitterContext = { bg = colors.palette.sumiInk2, sp = colors.palette.fujiWhite },
		}
	end,
}

vim.cmd 'colorscheme kanagawa'

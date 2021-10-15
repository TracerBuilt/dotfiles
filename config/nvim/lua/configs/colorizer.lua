require('colorizer').setup({
	'*',
	css = { names = true },
	scss = { names = true },
}, {
	mode = 'background',
	css_fn = true,
	names = false,
	RGB = true,
	RRGGBB = true,
	RRGGBBAA = true,
})

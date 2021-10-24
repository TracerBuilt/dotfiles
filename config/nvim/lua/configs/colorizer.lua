require('colorizer').setup({
	'*',
	css = { names = true },
	scss = { names = true },
}, {
	names = false,
	RGB = true,
	RRGGBB = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	mode = 'background',
})

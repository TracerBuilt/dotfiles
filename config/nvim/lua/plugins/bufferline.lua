return {
	'akinsho/bufferline.nvim',
	opts = function(_, opts)
		local palette = require('kanagawa.colors').setup().palette

		opts.options.themable = true
		opts.options.indicator = {
			icon = nil,
			style = 'underline',
		}
		opts.options.separator_style = { ' ', ' ' }
		opts.options.hover = {
			enabled = true,
			delay = 50,
			reveal = { 'close' },
		}

		opts.highlights = {
			tab_selected = {
				fg = palette.waveAqua1,
				underline = true,
				sp = palette.waveAqua2,
			},
			buffer_selected = {
				sp = palette.waveAqua2,
			},
		}
	end,
}

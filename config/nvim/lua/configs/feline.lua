local vi_mode_utils = require 'feline.providers.vi_mode'

require('feline').setup {
	colors = {
		bg = '#0e171c',
		fg = '#abb2bf',
		fg_gutter = '#3b4261',
		black = '#393b44',
		gray = '#2a2e36',
		red = '#c94f6d',
		green = '#97c374',
		yellow = '#dbc074',
		blue = '#61afef',
		magenta = '#c678dd',
		cyan = '#63cdcf',
		white = '#dfdfe0',
		orange = '#F4A261',
		pink = '#D67AD2',
		black_br = '#7f8c98',
		red_br = '#e06c75',
		green_br = '#58cd8b',
		yellow_br = '#FFE37E',
		blue_br = '#84CEE4',
		magenta_br = '#B8A1E3',
		cyan_br = '#59F0FF',
		white_br = '#FDEBC3',
		orange_br = '#F6A878',
		pink_br = '#DF97DB',
		comment = '#526175',
	},
	components = {
		active = {
			-- Left side
			{
				{
					provider = 'vi_mode',
					hl = function()
						return {
							name = vi_mode_utils.get_mode_highlight_name(),
							fg = vi_mode_utils.get_mode_color(),
							style = 'bold',
						}
					end,
					icon = '',
					right_sep = ' ',
				},
				{
					provider = 'file_info',
					hl = {
						fg = 'white',
						bg = 'fg_gutter',
						style = 'bold',
					},
					left_sep = {
						' ',
						'slant_left_2',
						{ str = ' ', hl = { bg = 'fg_gutter', fg = 'NONE' } },
					},
					right_sep = { 'slant_right_2', ' ' },
				},
				{
					provider = 'diagnostic_errors',
					hl = { fg = 'red' },
				},
				{
					provider = 'diagnostic_warnings',
					hl = { fg = 'yellow' },
				},
				{
					provider = 'diagnostic_hints',
					hl = { fg = 'cyan' },
				},
				{
					provider = 'diagnostic_info',
					hl = { fg = 'white' },
				},
			},
			-- Right side
			{

				{
					provider = 'git_diff_added',
					hl = {
						fg = 'green',
					},
				},
				{
					provider = 'git_diff_changed',
					hl = {
						fg = 'orange',
					},
				},
				{
					provider = 'git_diff_removed',
					hl = {
						fg = 'red',
					},
				},
				{
					provider = 'git_branch',
					hl = {
						fg = 'white',
						style = 'bold',
					},
					left_sep = {
						str = ' ',
						hl = {
							fg = 'NONE',
						},
					},
					right_sep = {
						str = ' ',
						hl = {
							fg = 'NONE',
						},
					},
				},

				{
					provider = 'position',
					left_sep = {
						str = ' ',
						hl = {
							bg = 'black',
						},
					},
					hl = {
						fg = 'white',
						bg = 'black',
						style = 'bold',
					},
				},
				{
					provider = 'line_percentage',
					hl = {
						fg = 'white',
						bg = 'black',
						style = 'bold',
					},
					left_sep = {
						str = ' ',
						hl = {
							bg = 'black',
						},
					},
					right_sep = {
						str = ' ',
						hl = {
							bg = 'black',
						},
					},
				},
				{
					provider = 'scroll_bar',
					hl = {
						bg = 'black',
						fg = 'blue',
						style = 'bold',
					},
				},
			},
		},
		inactive = {
			{
				{
					provider = 'file_type',
					hl = {
						fg = 'white',
						bg = 'fg_gutter',
						style = 'bold',
					},
					left_sep = {
						str = ' ',
						hl = {
							fg = 'NONE',
							bg = 'fg_gutter',
						},
					},
					right_sep = {
						{
							str = ' ',
							hl = {
								fg = 'NONE',
								bg = 'fg_gutter',
							},
						},
						'slant_right',
					},
				},
				-- Empty component to fix the highlight till the end of the statusline
				{},
			},
		},
	},
}

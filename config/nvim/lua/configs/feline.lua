local vi_mode_utils = require 'feline.providers.vi_mode'

local moonfly = {

	bg = 'none',
	bg_color = '#080808',
	fg = '#b2b2b2',
	bold = '#eeeeee',
	cursor = '#9e9e9e',
	selection = '#b2ceee',
	black = '#323437',
	red = '#ff5454',
	green = '#8cc85f',
	yellow = '#e3c78a',
	blue = '#80a0ff',
	magenta = '#d183e8',
	cyan = '#79dac8',
	white = '#de935f',
	black_br = '#f09479',
	red_br = '#ff5189',
	green_br = '#36c692',
	yellow_br = '#bfbf97',
	blue_br = '#74b2ff',
	magenta_br = '#ae81ff',
	cyan_br = '#85dc85',
	white_br = '#e2637f',
}

require('feline').setup {
	theme = moonfly,
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
							bg = 'bg',
							style = 'bold',
						}
					end,
					icon = '',
					right_sep = ' ',
				},
				{
					provider = 'file_info',
					hl = {
						fg = 'bg_color',
						bg = 'fg',
						style = 'bold',
					},
					left_sep = {
						' ',
						'slant_left_2',
						{ str = ' ', hl = { bg = 'fg', fg = 'NONE' } },
					},
					right_sep = {
						{ str = ' ', hl = { bg = 'fg', fg = 'NONE' } },
						'slant_right_2',
						' ',
					},
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
					hl = { fg = 'fg' },
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
						fg = 'yellow',
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
						fg = 'fg',
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
						hl = {},
					},
					hl = {
						fg = 'fg',

						style = 'bold',
					},
				},
				{
					provider = 'line_percentage',
					hl = {
						fg = 'fg',

						style = 'bold',
					},
					left_sep = {
						str = ' ',
						hl = {},
					},
					right_sep = {
						str = ' ',
						hl = {},
					},
				},
				{
					provider = 'scroll_bar',
					hl = {

						fg = 'magenta',
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
						fg = 'bg_color',
						bg = 'fg',
						style = 'bold',
					},
					left_sep = {
						str = ' ',
						hl = {
							fg = 'bg',
							bg = 'fg',
						},
					},
					right_sep = {
						{
							str = ' ',
							hl = {
								fg = 'bg',
								bg = 'fg',
							},
						},
						'slant_right',
					},
				},
			},
		},
	},
}

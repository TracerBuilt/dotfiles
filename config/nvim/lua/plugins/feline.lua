local vi_mode_utils = require 'feline.providers.vi_mode'

--[[
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

local colors = {
	bg = { 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE' },
	black = { '#181a1f', '#0e1013', '#151820', '#0c0e15', '#191a1c', '#101012', '#101012' },
	bg0 = { '#282c34', '#1f2329', '#242b38', '#1a212e', '#2c2d30', '#232326', '#fafafa' },
	bg1 = { '#31353f', '#282c34', '#2d3343', '#21283b', '#35373b', '#2c2d31', '#f0f0f0' },
	bg2 = { '#393f4a', '#30363f', '#343e4f', '#283347', '#3e4045', '#35363b', '#e6e6e6' },
	bg3 = { '#3b3f4c', '#323641', '#363c51', '#2a324a', '#404247', '#37383d', '#dcdcdc' },
	bg_d = { '#21252b', '#181b20', '#1e242e', '#141b24', '#242628', '#1b1c1e', '#c9c9c9' },
	bg_blue = { '#73b8f1', '#61afef', '#6db9f7', '#54b0fd', '#79b7eb', '#68aee8', '#68aee8' },
	bg_yellow = { '#ebd09c', '#e8c88c', '#f0d197', '#f2cc81', '#e6cfa1', '#e2c792', '#e2c792' },
	fg = { '#abb2bf', '#a0a8b7', '#a5b0c5', '#93a4c3', '#b1b4b9', '#a7aab0', '#383a42' },
	purple = { '#c678dd', '#bf68d9', '#ca72e4', '#c75ae8', '#c2fd7', '#bb70d2', '#a626a4' },
	green = { '#98c379', '#8ebd6b', '#97ca72', '#8bcd5b', '#99bc80', '#8fb573', '#50a14f' },
	orange = { '#d19a66', '#cc9057', '#d99a5e', '#dd9046', '#c99a6e', '#c49060', '#c18401' },
	blue = { '#61afef', '#4fa6ed', '#5ab0f6', '#41a7fc', '#68aee8', '#57a5e5', '#4078f2' },
	yellow = { '#e5c07b', '#e2b86b', '#ebc275', '#efbd5d', '#dfbe81', '#dbb671', '#986801' },
	cyan = { '#56b6c2', '#48b0bd', '#4dbdcb', '#34bfd0', '#5fafb9', '#51a8b3', '#0184bc' },
	red = { '#e86671', '#e55561', '#ef5f6b', '#f65866', '#e16d77', '#de5d68', '#e45649' },
	grey = { '#5c6370', '#535965', '#546178', '#455574', '#646568', '#5a5b5e', '#a0a1a7' },
	light_grey = { '#848b98', '#7a818e', '#7d899f', '#6c7d9c', '#8b8d91', '#818387', '#818387' },
	dark_cyan = { '#2b6f77', '#266269', '#25747d', '#1b6a73', '#316a71', '#2b5d63', '#2b5d63' },
	dark_red = { '#993939', '#8b3434', '#a13131', '#992525', '#914141', '#833b3b', '#833b3b' },
	dark_yellow = { '#93691d', '#835d1a', '#9a6b16', '#8f610d', '#8c6724', '#7c5c20', '#7c5c20' },
	dark_purple = { '#8a3fa0', '#7e3992', '#8f36a9', '#862aa1', '#854897', '#79428a', '#79428a' },
	diff_add = { '#31392b', '#272e23', '#303d27', '#27341c', '#32352f', '#282b26', '#282b26' },
	diff_delete = { '#382b2c', '#2d2223', '#3c2729', '#331c1e', '#342f2f', '#2a2626', '#2a2626' },
	diff_change = { '#1c3448', '#172a3a', '#18344c', '#102b40', '#203444', '#1a2a37', '#1a2a37' },
	diff_text = { '#2c5372', '#274964', '#265478', '#1c4a6e', '#32526c', '#2c485f', '#2c485f' },
}

local styles = { dark = 1, darker = 2, cool = 3, deep = 4, warm = 5, warmer = 6, light = 7 }
local function select_colors()
	local index = styles[vim.g.onedark_config.style] or 1
	local selected = { none = 'none' }
	for k, v in pairs(colors) do
		selected[k] = v[index]
	end
	selected = vim.tbl_extend('force', selected, vim.g.onedark_config.colors)
	return selected
end

local onedark = select_colors()

--]]
--
require('feline').setup {
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
						fg = 'bg_d',
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

						fg = 'purple',
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
						fg = 'bg_d',
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

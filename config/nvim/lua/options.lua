require 'nvchad.options'

local autocmd = vim.api.nvim_create_autocmd

autocmd('VimEnter', {
	command = ':silent !kitty @ set-spacing padding=0 margin=0',
})

autocmd('VimLeavePre', {
	command = ':silent !kitty @ set-spacing padding-v=2 padding-h=5',
})

local opt = vim.opt
local g = vim.g

if vim.g.neovide then
	opt.winblend = 60
	opt.pumblend = 60

	g.neovide_floating_blur_amount_x = 4.0
	g.neovide_floating_blur_amount_y = 4.0

	g.neovide_floating_shadow = true
	g.neovide_floating_z_height = 10
	g.neovide_light_angle_degrees = 45
	g.neovide_light_radius = 5

	g.neovide_transparency = 0.8

	g.neovide_padding_top = 0
	g.neovide_padding_bottom = 0
	g.neovide_padding_right = 0
	g.neovide_padding_left = 0
else
	opt.winblend = 35
	opt.pumblend = 35
end

opt.mousemoveevent = true

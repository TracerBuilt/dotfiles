-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

g.guifont = 'RecMonoLinear Nerd Font Mono'

if g.neovide then
	opt.winblend = 10
	opt.pumblend = 10

	g.neovide_floating_blur_amount_x = 5.0
	g.neovide_floating_blur_amount_y = 5.0

	g.neovide_floating_shadow = true
	g.neovide_floating_z_height = 15
	g.neovide_light_angle_degrees = 45
	g.neovide_light_radius = 10

	g.neovide_opacity = 0.90

	g.neovide_padding_top = 0
	g.neovide_padding_bottom = 0
	g.neovide_padding_right = 0
	g.neovide_padding_left = 0
else
	opt.winblend = 30
	opt.pumblend = 30
end

g.trouble_lualine = false
opt.mousemoveevent = true
opt.laststatus = 3

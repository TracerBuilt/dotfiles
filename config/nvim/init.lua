if vim.g.neovide then
	vim.o.winblend = 50
	vim.o.pumblend = 50

	vim.opt.linespace = 2
	vim.g.neovide_floating_blur_amount_x = 3.0
	vim.g.neovide_floating_blur_amount_y = 3.0
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 5
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_underline_stroke_scale = 2.0
end

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require 'settings'
require('lazy').setup 'plugins'
require 'map'

-- vim: ts=2 sts=2 sw=2 et

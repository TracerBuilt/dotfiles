-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

if vim.g.neovide then
	opt.winblend = 50
	opt.pumblend = 50

	g.neovide_floating_blur_amount_x = 3.0
	g.neovide_floating_blur_amount_y = 3.0
	g.neovide_transparency = 0.8
else
	opt.pumblend = 0
end

g.trouble_lualine = false
opt.mousemoveevent = true

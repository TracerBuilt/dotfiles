-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd

if not vim.g.neovide then
	autocmd('VimEnter', {
		command = ':silent !kitty @ set-spacing padding=0 margin=0',
	})

	autocmd('VimLeavePre', {
		command = ':silent !kitty @ set-spacing padding-v=2 padding-h=5',
	})
end

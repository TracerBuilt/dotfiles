-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd

autocmd('VimEnter', {
	command = ':silent !kitty @ set-spacing padding=0',
})

autocmd('VimLeavePre', {
	command = ':silent !kitty @ set-spacing padding-top=2 padding-right=5 padding-bottom=2 padding-left=5',
})

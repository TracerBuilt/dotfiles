if vim.g.vscode then
else
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
end

-- vim: ts=2 sts=2 sw=2 et

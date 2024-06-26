-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
	spec = {
		{ import = 'plugins/colorschemes', config = function() vim.cmd([[colorscheme kanagawa]]) end },
		-- import your plugins
		{ import = 'plugins' },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { 'habamax' } },
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
		-- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
		backdrop = 60,
		custom_keys = {
			-- You can define custom key maps here. If present, the description will
			-- be shown in the help menu.
			-- To disable one of the defaults, set it to false.
			['<leader>L'] = {
				function()
					require 'lazy'
				end,
			},

			['<localleader>l'] = {
				function(plugin)
					require('lazy.util').float_term({ 'lazygit', 'log' }, {
						cwd = plugin.dir,
					})
				end,
				desc = 'Open lazygit log',
			},

			['<localleader>t'] = {
				function(plugin)
					require('lazy.util').float_term(nil, {
						cwd = plugin.dir,
					})
				end,
				desc = 'Open terminal in plugin dir',
			},
		},
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = 'git',
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
}

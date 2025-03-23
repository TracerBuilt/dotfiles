return {
	'echasnovski/mini.files',
	ft = 'directory',
	init = function()
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesWindowOpen',
			callback = function(args)
				local win_id = args.data.win_id

				-- Customize window-local settings
				local config = vim.api.nvim_win_get_config(win_id)
				config.border = 'solid'
				vim.api.nvim_win_set_config(win_id, config)
			end,
		})
	end,
	opts = {
		mappings = {

			go_in = 'L',
			go_in_plus = 'l',
		},
		options = {
			use_as_default_explorer = true,
		},
	},
	keys = function()
		return {
			{
				'<leader>e',
				function()
					local mini_files = require 'mini.files'
					if not mini_files.close() then
						mini_files.open(vim.uv.cwd(), true)
					end
				end,
				desc = 'Toggle file tree',
			},
			{
				'<leader>E',
				function()
					require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = 'Open file tree (directory of current file)',
			},
		}
	end,
}

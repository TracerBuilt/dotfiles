return {
	'echasnovski/mini.files',
	ft = 'directory',
	init = function()
		-- FIX: use `autocmd` for lazy-loading mini.files instead of directly requiring it,
		-- because `cwd` is not set up properly.
		vim.api.nvim_create_autocmd('BufEnter', {
			group = vim.api.nvim_create_augroup('mini_files_start_directory', { clear = true }),
			desc = 'Start mini.files with directory',
			once = true,
			callback = function()
				if package.loaded['mini.files'] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == 'directory' then
						require('mini.files').open()
					end
				end
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
				'<leader>n',
				function()
					require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = 'Open mini.files (Directory of Current File)',
			},
			{
				'<leader>N',
				function()
					require('mini.files').open(vim.uv.cwd(), true)
				end,
				desc = 'Open mini.files (cwd)',
			},
		}
	end,
}

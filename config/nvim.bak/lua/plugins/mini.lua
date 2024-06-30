return {
	'echasnovski/mini.nvim',
	version = false,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('mini.files').setup {
			mappings = {
				go_in = 'L',
				go_in_plus = 'l',
			},
			windows = {
				preview = true,
			},
		}

		local minifiles_toggle = function()
			if not MiniFiles.close() then
				MiniFiles.open()
			end
		end

		local files_set_cwd = function(path)
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				vim.keymap.set('n', '.', files_set_cwd, { buffer = args.data.buf_id })
			end,
		})

		local wk = require 'which-key'

		wk.register {
			['<leader>n'] = { minifiles_toggle, 'Toggle File Tree' },
		}
	end,
}

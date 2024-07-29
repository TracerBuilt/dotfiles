return {
	'echasnovski/mini.files',
	ft = 'directory',
	init = function()
		-- Use `autocmd` for lazy-loading mini.files instead of directly requiring it,
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

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			desc = 'Disable cmp in mini.files',
			callback = function()
				require('cmp').setup.buffer { enabled = false, completion = { autocomplete = false } }
			end,
		})

		-- Mapping for setting cwd
		local files_set_cwd = function(path)
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				vim.keymap.set(
					'n',
					'g,',
					files_set_cwd,
					{ buffer = args.data.buf_id, desc = 'Set cwd' }
				)
			end,
		})

		-- Mapping for showing and hiding dotfiles
		local show_dotfiles = true

		local filter_show = function(fs_entry)
			return true
		end

		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, '.')
		end

		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			MiniFiles.refresh { content = { filter = new_filter } }
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak left-hand side of mapping to your liking
				vim.keymap.set(
					'n',
					'g.',
					toggle_dotfiles,
					{ buffer = buf_id, desc = 'Show/hide dotfiles' }
				)
			end,
		})

		-- Autocommand for customizing window on opening
		--
		-- local border = {
		-- 	{ '🭽', 'FloatBorder' },
		-- 	{ '▔', 'FloatBorder' },
		-- 	{ '🭾', 'FloatBorder' },
		-- 	{ '▕', 'FloatBorder' },
		-- 	{ '🭿', 'FloatBorder' },
		-- 	{ '▁', 'FloatBorder' },
		-- 	{ '🭼', 'FloatBorder' },
		-- 	{ '▏', 'FloatBorder' },
		-- }

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
		local minifiles_toggle = function()
			local mini_files = require 'mini.files'
			if not mini_files.close() then
				mini_files.open(vim.uv.cwd(), true)
			end
		end

		return {
			{
				'<C-n>',
				minifiles_toggle,
				desc = 'Toggle file tree',
			},
			{
				'<leader>n',
				function()
					require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = 'Open file tree (directory of current file)',
			},
			{
				'<leader>N',
				function()
					require('mini.files').open(vim.uv.cwd(), true)
				end,
				desc = 'Open file tree (cwd)',
			},
		}
	end,
}

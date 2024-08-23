require 'nvchad.mappings'

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

map('n', 'j', 'gj', { remap = false })
map('n', 'k', 'gk', { remap = false })

map('n', ';', ':', { desc = 'CMD enter command mode' })

map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })

map('n', 'L', function()
	require('nvchad.tabufline').next()
end, { desc = 'Next buffer' })

map('n', 'H', function()
	require('nvchad.tabufline').prev()
end, { desc = 'Previous buffer' })

-- File tree
local minifiles_toggle = function()
	local mini_files = require 'mini.files'
	if not mini_files.close() then
		mini_files.open(vim.uv.cwd(), true)
	end
end

map('n', '<leader>n', minifiles_toggle, { desc = 'Toggle file tree' })

map('n', '<leader>N', function()
	require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
end, { desc = 'Open file tree (directory of current file)' })

-- Harpoon
map('n', '<leader>h', function()
	local harpoon = require 'harpoon'

	local conf = require('telescope.config').values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}

		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require('telescope.pickers')
			.new({}, {
				prompt_title = 'Harpoon',
				finder = require('telescope.finders').new_table {
					results = file_paths,
				},
				previewer = conf.file_previewer {},
				sorter = conf.generic_sorter {},
			})
			:find()
	end

	toggle_telescope(harpoon:list())
end, { desc = 'Harpoon quick menu', remap = false })

-- Yanky

map('n', '<c-n>', '<Plug>(YankyNextEntry)', { desc = 'Select next entry through yank history' })

unmap('n', '<leader>x')
unmap('n', '<leader>v')
unmap('n', '<leader>e')

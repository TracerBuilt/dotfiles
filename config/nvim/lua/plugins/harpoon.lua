return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	keys = function()
		local keys = {
			{
				'<leader>H',
				function()
					require('harpoon'):list():add()
				end,
				desc = 'Harpoon file',
			},
			{
				'<leader>h',
				function()
					local conf = require('telescope.config').values

					local harpoon = require 'harpoon'
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
				end,
				desc = 'Harpoon quick menu',
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				'<leader>' .. i,
				function()
					require('harpoon'):list():select(i)
				end,
				desc = 'Harpoon to file ' .. i,
			})
		end

		return keys
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
}

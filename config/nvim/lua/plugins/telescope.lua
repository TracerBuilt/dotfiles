return {
	'nvim-telescope/telescope.nvim',
	opts = function(_, opts)
		opts.defaults.borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
		opts.defaults.winblend = nil

		opts.extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
		}

		table.insert(opts.extensions_list, 'fzf')
	end,

	config = function(_, opts)
		local telescope = require 'telescope'
		telescope.setup(opts)

		for _, ext in ipairs(opts.extensions_list) do
			telescope.load_extension(ext)
		end
	end,

	dependencies = {
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
		},
	},
}

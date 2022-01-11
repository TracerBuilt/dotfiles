require('zen-mode').setup {
	window = {
		backdrop = 1,
		width = 120,
		height = 1,
		options = {
			-- signcolumn = 'no',
			-- number = false,
			-- relativenumber = false,
			-- cursorline = false,
			-- cursorcolumn = false,
			-- foldcolumn = '0',
			-- list = false,
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false,
			showcmd = false,
		},
		twilight = { enabled = true },
		gitsigns = { enabled = true },
		kitty = {
			enabled = true,
			font = '+2',
		},
	},
}

local ok, hl = pcall(vim.api.nvim_get_hl_by_name, 'Normal', true)
if hl['background'] == nil then
	bg = 'NONE'
end

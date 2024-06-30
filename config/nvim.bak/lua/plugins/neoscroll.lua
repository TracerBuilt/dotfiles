if vim.g.neovide then
	return {}
else
	return {
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup {}
		end,
	}
end

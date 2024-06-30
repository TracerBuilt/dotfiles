return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = true,
	config = function()
		require('catppuccin').setup {
			transparent_background = true,
			term_colors = false,
			styles = {
				comments = 'italic',
				functions = 'italic',
				keywords = 'italic',
				strings = 'NONE',
				variables = 'NONE',
			},
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = 'italic',
						hints = 'italic',
						warnings = 'italic',
						information = 'italic',
					},
					underlines = {
						errors = 'undercurl',
						hints = 'undercurl',
						warnings = 'undercurl',
						information = 'undercurl',
					},
				},
				lsp_trouble = true,
				lsp_saga = false,
				gitgutter = false,
				gitsigns = true,
				telescope = true,
				nvimtree = {
					enabled = false,
					show_root = false,
				},
				which_key = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				dashboard = false,
				neogit = false,
				vim_sneak = false,
				fern = false,
				barbar = true,
				bufferline = false,
				markdown = true,
				lightspeed = true,
				ts_rainbow = true,
				hop = false,
			},
		}
	end,
}

return {
	'nvim-lualine/lualine.nvim',
	opts = function(_, opts)
		local theme = require('kanagawa.colors').setup().theme

		local kanagawa = {}

		kanagawa.normal = {
			a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
			b = { bg = 'None', fg = theme.syn.fun },
			c = { bg = 'None', fg = theme.ui.fg },
		}

		kanagawa.insert = {
			a = { bg = theme.diag.ok, fg = theme.ui.bg },
			b = { bg = 'None', fg = theme.diag.ok },
		}

		kanagawa.command = {
			a = { bg = theme.syn.operator, fg = theme.ui.bg },
			b = { bg = 'None', fg = theme.syn.operator },
		}

		kanagawa.visual = {
			a = { bg = theme.syn.keyword, fg = theme.ui.bg },
			b = { bg = 'None', fg = theme.syn.keyword },
		}

		kanagawa.replace = {
			a = { bg = theme.syn.constant, fg = theme.ui.bg },
			b = { bg = 'None', fg = theme.syn.constant },
		}

		kanagawa.inactive = {
			a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			b = { bg = 'None', fg = theme.ui.fg_dim, gui = 'bold' },
			c = { bg = 'None', fg = theme.ui.fg_dim },
		}
		opts.options.theme = kanagawa
		table.remove(opts.sections.lualine_x, 1)
		opts.sections.lualine_y = { 'progress' }
		opts.sections.lualine_z = { 'location' }
	end,
}

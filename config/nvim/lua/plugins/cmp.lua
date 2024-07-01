return {
	'hrsh7th/nvim-cmp',
	opts = {
		viw = {
			entries = { name = 'custom', selection_order = 'near_cursor' },
		},
		window = {
			completion = require('cmp').config.window.bordered(),
			documentation = require('cmp').config.window.bordered(),
		},
		formatting = {
			format = function(entry, item)
				local icons = LazyVim.config.icons.kinds
				if icons[item.kind] then
					item.kind = icons[item.kind]
				end

				local widths = {
					abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
				}

				for key, width in pairs(widths) do
					if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
						item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
					end
				end

				return item
			end,
		},
	},
}

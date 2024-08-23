return {
	'hrsh7th/nvim-cmp',
	opts = function(_, opts)
		opts.view = {
			entries = { selection_order = 'near_cursor' },
		}

		opts.window = {
			completion = {
				winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
				col_offset = -2,
				side_padding = 0,
			},
		}
		opts.formatting = nil
		opts.formatting = {
			fields = { 'kind', 'abbr' },
			format = function(entry, item)
				item.kind = LazyVim.config.icons.kinds[item.kind]
				item.menu = ''

				local widths = {
					kind = vim.g.cmp_widths and vim.g.cmp_widths.kind or 20,
					abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
				}

				for key, width in pairs(widths) do
					if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
						item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
					end
				end

				return item
			end,
		}
		opts.mapping['<CR>'] = require('cmp').mapping {
			i = function(fallback)
				if
					require('cmp').visible()
					and require('cmp').get_active_entry()
					and require('cmp').get_active_entry().source.name ~= 'supermaven'
				then
					require('cmp').confirm {
						behavior = require('cmp').ConfirmBehavior.Replace,
						select = false,
					}
				else
					fallback()
				end
			end,
		}

		opts.experimental.ghost_text = false

		table.insert(opts.sources, { name = 'supermaven', group_index = 1, priority = 100 })
	end,
}

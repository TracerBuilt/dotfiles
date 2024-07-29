return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	opts = function(_, opts)
		opts.view = {
			entries = { selection_order = 'near_cursor' },
		}

		opts.window = {
			completion = {
				winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
				col_offset = -3,
				side_padding = 0,
			},
		}
		table.insert(opts.sources, { name = 'supermaven', group_index = 1, priority = 100 })
		opts.formatting = {
			fields = { 'kind', 'abbr' },
			format = function(entry, item)
				local icons = LazyVim.config.icons.kinds

				if icons[item.kind] then
					item.kind = icons[item.kind] .. item.kind
				end

				local strings = vim.split(item.kind, '%s', { trimempty = true })
				item.kind = ' ' .. (strings[1] or '') .. ' '

				return item
			end,
		}

		opts.experimental.ghost_text = false
	end,
}

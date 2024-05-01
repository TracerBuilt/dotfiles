return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'petertriho/cmp-git',
		'onsails/lspkind-nvim',
		'neovim/nvim-lspconfig',
	},
	config = function()
		vim.opt.completeopt = 'menu,menuone,noselect'

		-- nvim-cmp setup
		local cmp = require 'cmp'
		local lspkind = require 'lspkind'

		cmp.setup {

			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				-- { name = 'luasnip' }, -- For luasnip users.
				{ name = 'codeium' },
			}, {
				{ name = 'buffer' },
			}),

			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,

					function(entry1, entry2)
						local _, entry1_under = entry1.completion_item.label:find '^_+'
						local _, entry2_under = entry2.completion_item.label:find '^_+'
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end,

					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},

			formatting = {
				format = lspkind.cmp_format {
					mode = 'symbol',
					maxwidth = 50,
					ellipsis_char = '…',
					symbol_map = { Codeium = '' },

					before = function(_, vim_item)
						return vim_item
					end,
				},
			},
		}

		-- Set configuration for specific filetype.
		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'git' },
			}, {
				{ name = 'buffer' },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}

return {
	'hrsh7th/nvim-cmp',
	event = { 'InsertEnter', 'CmdlineEnter' },
	opts = function(_, opts)
		local cmp = require 'cmp'
		dofile(vim.g.base46_cache .. 'cmp')
		local cmp_ui = require('nvconfig').ui.cmp
		local cmp_style = cmp_ui.style

		opts.snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		}
		opts.mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),

			['<CR>'] = cmp.mapping {
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() and cmp.get_active_entry().source.name ~= 'supermaven' then
						cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm { select = true },
			},
		}

		opts.window.completion.border = 'none'

		if cmp_style == 'atom' or cmp_style == 'atom_colored' then
			opts.window.completion.col_offset = (cmp_style == 'atom' or cmp_style == 'atom_colored') and -3 or 0
		end
		opts.window.documentation.border = { '', '', '', ' ', ' ', ' ', ' ', ' ' }
		opts.window.documentation.side_padding = 3

		opts.sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'snippets' },
			{ name = 'path' },
		}, {
			{ name = 'buffer' },
		})
	end,
	config = function(_, opts)
		local cmp = require 'cmp'

		cmp.setup(opts)

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
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		{
			'garymjr/nvim-snippets',
			opts = {
				friendly_snippets = true,
			},
			dependencies = { 'rafamadriz/friendly-snippets' },
		},
		{
			'windwp/nvim-autopairs',
			opts = {
				fast_wrap = {},
				disable_filetype = { 'TelescopePrompt', 'vim' },
			},
			config = function(_, opts)
				require('nvim-autopairs').setup(opts)

				-- setup cmp for autopairs
				local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
				require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
			end,
		},
	},
}

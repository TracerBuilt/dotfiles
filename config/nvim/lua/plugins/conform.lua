return {
	{
		'stevearc/conform.nvim',
		event = 'BufWritePre', -- uncomment for format on save
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>F',
				function()
					require('conform').format { async = true, lsp_format = 'fallback', timeout = 3000 }
				end,
				desc = 'Format buffer',
			},
		},

		---@module 'conform'
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				css = { 'prettierd', 'prettier', stop_after_first = true },
				html = { 'prettierd', 'prettier', stop_after_first = true },
				javascript = { 'prettierd', 'prettier', stop_after_first = true },
				javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
				json = { 'prettierd', 'prettier', stop_after_first = true },
				jsonc = { 'prettierd', 'prettier', stop_after_first = true },
				less = { 'prettierd', 'prettier', stop_after_first = true },
				markdown = { 'prettierd', 'prettier', stop_after_first = true },
				scss = { 'prettierd', 'prettier', stop_after_first = true },
				typescript = { 'prettierd', 'prettier', stop_after_first = true },
				typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
				vue = { 'prettierd', 'prettier', stop_after_first = true },
				yaml = { 'prettierd', 'prettier', stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = 'fallback',
			},
		},
		config = function(_, opts)
			require('conform').setup(opts)
		end,
	},
}

return {
	'stevearc/conform.nvim',
	opts = {

		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			svelte = { 'stylelint', 'prettierd' },
			vue = { 'prettierd' },
			json = { 'prettierd' },
			css = { 'stylelint', 'prettierd' },
			scss = { 'stylelint', 'prettierd' },
		},
		format_on_save = {
			timeout_ms = 10000,
			lsp_fallback = true,
		},
	},
}

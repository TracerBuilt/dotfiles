return {
	'stevearc/conform.nvim',
	opts = {

		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettier' },
			javascriptreact = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			svelte = { 'prettier' },
			vue = { 'prettier' },
			json = { 'prettier' },
			toml = { 'taplo' },
		},
		format_on_save = {
			timeout_ms = 10000,
			lsp_fallback = true,
		},
	},
}

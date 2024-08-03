return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		'williamboman/mason.nvim',
	},
	config = function()
		local lspconfig = require 'lspconfig'

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local opts = { capabilities = capabilities }

		require('mason-lspconfig').setup {
			ensure_installed = {
				'cssls',
				'eslint',
				'html',
				'htmx',
				'jsonls',
				'lemminx',
				'lua_ls',
				'prismals',
				'pylsp',
				'rust_analyzer',
				'stylelint_lsp',
				'svelte',
				'tailwindcss@0.0.0-insiders.3d0673b',
				'taplo',
				'typos_lsp',
				'yamlls',
				'vimls',
			},

			handlers = {

				function(server_name)
					lspconfig[server_name].setup(opts)
				end,

				['cssls'] = function()
					lspconfig.cssls.setup {
						opts,
						settings = {
							css = {
								lint = {
									unknownAtRules = 'ignore',
								},
							},
						},
					}
				end,

				['lua_ls'] = function()
					-- Make runtime files discoverable to the server
					local runtime_path = vim.split(package.path, ';')
					table.insert(runtime_path, 'lua/?.lua')
					table.insert(runtime_path, 'lua/?/init.lua')

					lspconfig.lua_ls.setup {
						opts,
						settings = {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using (most likely LuaJIT)
									version = 'LuaJIT',
								},
								diagnostics = {
									globals = { 'vim' },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file('', true),
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = { enable = false },
							},
						},
					}
				end,

				['svelte'] = function()
					lspconfig.svelte.setup {
						opts,
					}
				end,
			},
		}
	end,
}

return {
	{
		'williamboman/mason.nvim',
		opts = nil,
	},
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		event = 'VeryLazy',
		opts = {
			ensure_installed = {
				'bash-language-server',
				'buf-language-server',
				'css-lsp',
				'eslint-lsp',
				'eslint_d',
				'html-lsp',
				'htmx-lsp',
				'hyprls',
				'json-lsp',
				'lua-language-server',
				'prettier',
				'prettierd',
				'rust_analyzer',
				'sqlls',
				'svelte-language-server',
				'stylua',
				'tailwindcss-language-server',
				'vim-language-server',
				'vue-language-server',
				'vtsls',
				'yaml-language-server',
			},
		},
		config = function(_, opts)
			require('mason-tool-installer').setup(opts)
		end,
		dependencies = { 'williamboman/mason.nvim' },
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {},
		event = 'User FilePost',
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)

			dofile(vim.g.base46_cache .. 'lsp')
			require('nvchad.lsp').diagnostic_config()

			local map = vim.keymap.set

			local on_attach = function(args)
				local function buf_opts(desc)
					return { buffer = args.buf, desc = desc }
				end

				map('n', 'gD', vim.lsp.buf.declaration, buf_opts 'Go to declaration')
				map('n', 'gd', vim.lsp.buf.definition, buf_opts 'Go to definition')
				map('n', 'gi', vim.lsp.buf.implementation, buf_opts 'Go to implementation')
				map('n', '<leader>sh', vim.lsp.buf.signature_help, buf_opts 'Show signature help')
				map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, buf_opts 'Add workspace folder')
				map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, buf_opts 'Remove workspace folder')

				map('n', '<leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, buf_opts 'List workspace folders')

				map('n', '<leader>D', vim.lsp.buf.type_definition, buf_opts 'Go to type definition')

				map('n', '<leader>ra', function()
					require 'nvchad.lsp.renamer'()
				end, buf_opts 'NvRenamer')

				map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, buf_opts 'Code action')
				map('n', 'gr', vim.lsp.buf.references, buf_opts 'Show references')
			end

			local capabilities = vim.tbl_deep_extend(
				'force',
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require('cmp_nvim_lsp').default_capabilities()
			)

			require('mason-lspconfig').setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require('lspconfig')[server_name].setup {
						on_attach = on_attach,
						capabilities = vim.deepcopy(capabilities),
					}
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				require('lspconfig').lua_ls.setup {
					on_attach = on_attach,
					capabilities = vim.deepcopy(capabilities),

					settings = {
						Lua = {
							codeLens = {
								enable = true,
							},
							hint = {
								enable = true,
							},
						},
					},
				},
			}
		end,
		dependencies = {
			'williamboman/mason.nvim',
			{
				'neovim/nvim-lspconfig',
				event = nil,
				opts = nil,
				config = nil,
			},
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
		},
	},
}

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local lspconfig = require 'lspconfig'

		-- Add additional capabilities supported by nvim-cmp
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local lsp_opts = {
			capabilities = capabilities,
		}

		lspconfig.html.setup(lsp_opts)
		lspconfig.cssls.setup {
			lsp_opts,
			settings = {
				css = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
			},
		}
		lspconfig.tsserver.setup(lsp_opts)
		lspconfig.eslint.setup(lsp_opts)
		lspconfig.svelte.setup(lsp_opts)
		lspconfig.jsonls.setup(lsp_opts)
		lspconfig.rust_analyzer.setup(lsp_opts)
		lspconfig.jdtls.setup(lsp_opts)
		lspconfig.lemminx.setup(lsp_opts)
		lspconfig.tailwindcss.setup(lsp_opts)
		lspconfig.typos_lsp.setup(lsp_opts)

		-- Make runtime files discoverable to the server
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, 'lua/?.lua')
		table.insert(runtime_path, 'lua/?/init.lua')

		lspconfig.lua_ls.setup {
			lsp_opts,
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
		lspconfig.vimls.setup(lsp_opts)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {

			group = vim.api.nvim_create_augroup('UserLspConfig', {}),

			callback = function(ev)
				local opts = { buffer = ev.buf }
				local wk = require 'which-key'

				--[[ local open_hover = function()
					for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
						local win_config = vim.api.nvim_win_get_config(win)
						if win_config.relative == 'win' then
							vim.api.nvim_win_close(win, false)
						end
					end

					vim.lsp.buf.hover()
				end ]]

				local diagnostic_opts = {
					bufnr = ev.buf,
					scope = 'line',
					source = 'if_many',
					close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost', 'WinNew' },
					border = 'rounded',
				}

				-- LSP
				wk.register({
					g = {
						D = { vim.lsp.buf.declaration, 'Go To Declaration' },
						d = { require('telescope.builtin').lsp_definitions, 'Go To Definition' },
						i = { require('telescope.builtin').lsp_implementations, 'List All Implementations' },
						r = { require('telescope.builtin').lsp_references, 'List All References' },
						y = { require('telescope.builtin').lsp_type_definitions, 'Go To Type Definition' },
					},
					['<C-k>'] = { vim.lsp.buf.signature_help, 'Display Signature Info' },
					['<C-x>'] = {
						function()
							vim.diagnostic.open_float(diagnostic_opts)
						end,
						'Open Line Diagnostics',
					},
					['<leader>'] = {
						F = { require('conform').format, 'Format File' },
						rn = { vim.lsp.buf.rename, 'Rename All References' },
						ca = { vim.lsp.buf.code_action, 'Code Actions', mode = { 'n', 'v' } },
						wa = { vim.lsp.buf.add_workspace_folder, 'Add Workspace Folder' },
						wr = { vim.lsp.buf.remove_workspace_folder, 'Remove Workspace Folder' },
						wl = {
							function()
								print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
							end,
							'List Workspace Folders',
						},
					},
				}, opts)
			end,
		})
	end,
}

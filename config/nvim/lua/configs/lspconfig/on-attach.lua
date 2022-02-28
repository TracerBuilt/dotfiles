---@diagnostic disable-next-line: unused-local
return function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

	if client.name == 'tsserver' or 'jsonls' then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	if client.name == 'tsserver' then
		local ts_utils = require 'nvim-lsp-ts-utils'

		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers indicate higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- eslint
			eslint_enable_code_actions = false,
			eslint_enable_disable_comments = true,
			eslint_bin = 'eslint_d',
			eslint_enable_diagnostics = false,
			eslint_opts = {},

			-- formatting
			enable_formatting = false,
			formatter = 'prettier',
			formatter_opts = {},

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = 'Comment',
		}

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':TSLspRenameFile<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<CR>', opts)
	end

	vim.cmd [[augroup Format]]
	vim.cmd [[autocmd! * <buffer>]]
	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
	vim.cmd [[augroup END]]
end

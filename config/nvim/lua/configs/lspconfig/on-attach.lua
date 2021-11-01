---@diagnostic disable-next-line: unused-local
return function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

	if client.name == 'svelte' or client.name == 'jsonls' then
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == 'tsserver' then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local ts_utils = require 'nvim-lsp-ts-utils'

		ts_utils.setup {
			eslint_bin = 'eslint_d',
			enable_formatting = true,
		}

		ts_utils.setup_client(client)
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd [[
          augroup Format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 7000)
          augroup END
        ]]
	end
end

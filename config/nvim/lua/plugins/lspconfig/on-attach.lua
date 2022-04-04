---@diagnostic disable-next-line: unused-local
return function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

	if client.name == 'tsserver' or 'jsonls' or 'svelte' then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	vim.cmd [[augroup Format]]
	vim.cmd [[autocmd! * <buffer>]]
	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
	vim.cmd [[augroup END]]
end

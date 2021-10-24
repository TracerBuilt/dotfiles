---@diagnostic disable-next-line: unused-local
return function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Only use efm formatting
	if client.name ~= 'efm' then
		client.resolved_capabilities.document_formatting = false
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

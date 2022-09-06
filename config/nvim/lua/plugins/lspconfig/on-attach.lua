---@diagnostic disable-next-line: unused-local
return function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

	if client.name ~= 'null-ls' then
		require('illuminate').on_attach(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end

	vim.api.nvim_create_augroup('Format', { clear = true })
	vim.api.nvim_create_autocmd('BufWritePre', {
		group = 'Format',
		pattern = '<buffer>',
		callback = function()
			vim.lsp.buf.format{ timeout_ms = 10000 }
		end,
	})

	-- vim.cmd [[augroup Format]]
	-- vim.cmd [[autocmd! * <buffer>]]
	-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
	-- vim.cmd [[augroup END]]
end

require('bufferline').setup {
	options = {
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ''
			for e, n in pairs(diagnostics_dict) do
				local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
				s = n .. sym
			end
			return s
		end,
		offsets = {
			{
				filetype = 'NvimTree',
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = 'Directory',
				text_align = 'left',
			},
		},
	},
}

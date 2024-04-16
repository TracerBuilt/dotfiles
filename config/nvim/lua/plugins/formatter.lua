local util = require 'formatter.util'
local prettierd = { require('formatter.defaults.prettierd') }

require('formatter').setup {
	filetype = {
		lua = {
			require('formatter.filetypes.lua').stylua
		},
		javascript = prettierd,
		javascriptreact = prettierd,
		typescript = prettierd,
		typescriptreact = prettierd,
		svelte = prettierd,
		vue = prettierd,
		json = prettierd,

	}
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

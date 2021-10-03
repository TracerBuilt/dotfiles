local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local wk = require 'which-key'

-- Remap ESC key
map('i', 'jk', '<ESC>', { noremap = true })
-- nvim-tree
wk.register {
	['<C-n>'] = { ':lua require("configs.treetoggle").toggle()<cr>', 'Toggle File Tree' },
	['<leader>r'] = { ':NvimTreeRefresh<cr>', 'Refresh File Tree' },
	['<leader>n'] = { ':NvimTreeFocus<cr>', 'Focus File Tree' },
}
-- Telescope
wk.register({
	f = {
		name = 'File',
		f = { ":lua require('telescope.builtin').find_files()", 'Find Files' },
		g = { ":lua require('telescope.builtin').live_grep()", 'Live Grep' },
		b = { ":lua require('telescope.builtin').buffers()", 'Find Buffers' },
		h = { ":lua require('telescope.builtin').help_tags()", 'Help Tags' },
	},
}, {
	prefix = '<leader>',
})
-- Barbar
wk.register {
	['<A-,>'] = { ':BufferPrevious<cr>', 'Previous Buffer' },
	['<A-.>'] = { ':BufferNext<cr>', 'Next Buffer' },
	-- Re-order
	['<A-<>'] = { ':BufferMovePrevious<cr>', 'Re-Order Buffer To Previous' },
	['<A->>'] = { ':BufferMoveNext<cr>', 'Re-Order Buffer To Next' },
	-- Goto
	['<A-1>'] = { ':BufferGoto 1<cr>', 'Go To Buffer 1' },
	['<A-2>'] = { ':BufferGoto 2<cr>', 'Go To Buffer 2' },
	['<A-3>'] = { ':BufferGoto 3<cr>', 'Go To Buffer 3' },
	['<A-4>'] = { ':BufferGoto 4<cr>', 'Go To Buffer 4' },
	['<A-5>'] = { ':BufferGoto 5<cr>', 'Go To Buffer 5' },
	['<A-6>'] = { ':BufferGoto 6<cr>', 'Go To Buffer 6' },
	['<A-7>'] = { ':BufferGoto 7<cr>', 'Go To Buffer 7' },
	['<A-8>'] = { ':BufferGoto 8<cr>', 'Go To Buffer 8' },
	['<A-9>'] = { ':BufferGoto 9<cr>', 'Go To Buffer 9' },
	['<A-0>'] = { ':BufferLast<cr>', 'Go To Last Buffer' },
	--
	['<A-c>'] = { ':BufferClose<cr>', 'Close Buffer' },
	-- Magic buffer-picking mode
	['<C-p>'] = { ':BufferPick<cr>', 'Pick Buffer' },
	-- Sort automatically
	['<leader>'] = {
		bb = { ':BufferOrderByBufferNumber<cr>', 'Order Buffers By Number' },
		bd = { ':BufferOrderByDirectory<cr>', 'Order Buffers By Directory' },
		bl = { ':BufferOrderByLanguage<cr>', 'Order Buffers By Language' },
	},
}
-- Trouble
wk.register {
	['<leader>x'] = {
		x = { ':Trouble<cr>', 'Open Diagnostics' },
		w = { ':Trouble lsp_workspace_diagnostics<cr>', 'Open Workspace Diagnostics' },
		d = { ':Trouble lsp_document_diagnostics<cr>', 'Open Document Diagnostics' },
		l = { ':Trouble loclist<cr>', 'Open Location List' },
		q = { ':Trouble quickfix<cr>', 'Open Quickfix List' },
	},
	['gR'] = { ':Trouble lsp_references<cr>', 'LSP References' },
}
-- Zen Mode
wk.register {
	['<leader>z'] = { ':TZA<cr>', 'Zen Mode' },
}
-- Git diffing

wk.register {

	['<leader>'] = {

		d = { ':DiffviewOpen<cr>', 'Open Git Diff' },

		dq = { ':DiffviewClose<cr>', 'Close Git Diff' },

	},

}

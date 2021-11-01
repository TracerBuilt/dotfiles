local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local wk = require 'which-key'

-- Remap ESC key
map('i', 'jk', '<ESC>', { noremap = true })

-- LSP
wk.register {
	g = {
		d = { '<cmd>Telescope lsp_definitions<cr>', 'Go-To Defintion' },
		D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go-To Declaration' },
		i = { '<cmd>Telescope lsp_implementations<cr>', 'List All Implementations' },
		r = { '<cmd>Telescope lsp_references<cr>', 'List All References' },
		t = { '<cmd>Telescope lsp_type_definitions()<cr>', 'Go-To Type Definition' },
	},
	K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Display Hover Info' },
	['C-k'] = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Display Signature Info' },
	['<leader>'] = {
		rn = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename All References' },
		ca = { '<cmd>Telescope lsp_code_actions<cr>', 'Code Actions' },
		F = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format File' },
	},
}

-- nvim-tree
wk.register {
	['<C-n>'] = { '<cmd>lua require("ui.treetoggle").toggle()<cr>', 'Toggle File Tree' },
	['<leader>r'] = { '<cmd>NvimTreeRefresh<cr>', 'Refresh File Tree' },
	['<leader>n'] = { '<cmd>NvimTreeFindFile<cr>', 'Focus File Tree' },
}
-- Telescope
wk.register {
	['<leader>f'] = {
		name = 'File',
		f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
		g = { '<cmd> Telescope live_grep<cr>', 'Live Grep' },
		b = { '<cmd>Telescope buffers<cr>', 'Find Buffers' },
		h = { '<cmd>Telescope help_tags<cr>', 'Help Tags' },
		o = { '<cmd>Telescope vim_options<cr>', 'Vim Options' },
		t = { '<cmd>Telescope treesitter<cr>', 'Treesitter Symbols' },
		c = { '<cmd>Telescope colorscheme<cr>', 'Color Schemes' },
		i = { '<cmd>Telescope highlights<cr>', 'Color Schemes' },

		G = {
			name = 'Git',
			c = { '<cmd>Telescope git_commits<cr>', 'List All Commits' },
			C = { '<cmd>Telescope git_bcommits<cr>', 'List Buffer Commits' },
			b = { '<cmd>Telescope git_branches<cr>', 'List Branches' },
			s = { '<cmd>Telescope git_status<cr>', 'List Current Changes' },
			S = { '<cmd>Telescope git_stash<cr>', 'List Stash Items' },
		},
	},
}
-- GitSigns
wk.register {
	[']c'] = { expr = true, '&diff ? "]c" : "<cmd>lua require\'gitsigns.actions\'.next_hunk()<cr>"', 'Next Hunk' },
	['[c'] = {
		expr = true,
		'&diff ? "[c" : "<cmd>lua require\'gitsigns.actions\'.prev_hunk()<cr>"',
		'Previous Hunk',
	},
	['<leader>h'] = {
		name = 'GitSigns Actions',
		['s'] = { '<cmd>lua require("gitsigns").stage_hunk<cr>', 'Stage Hunk' },
		['u'] = { '<cmd>lua require("gitsigns").undo_stage_hunk<cr>', 'Undo Stage Hunk' },
		['r'] = { '<cmd>lua require("gitsigns").reset_hunk<cr>', 'Reset Hunk' },
		['R'] = { '<cmd>lua require"gitsigns".reset_buffer()<cr>', 'Reset Buffer' },
		['p'] = { '<cmd>lua require"gitsigns".preview_hunk()<cr>', 'Preview Hunk' },
		['b'] = { '<cmd>lua require"gitsigns".blame_line(true)<cr>', 'Blame Line' },
		['S'] = { '<cmd>lua require"gitsigns".stage_buffer()<cr>', 'Stage Buffer' },
		['U'] = { '<cmd>lua require"gitsigns".reset_buffer_index()<cr>', 'Reset Buffer' },
	},
}
wk.register({
	['<leader>h'] = {
		name = 'GitSigns Actions',
		s = { '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Stage Hunk' },
		r = { '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Reset Hunk' },
	},
}, {
	mode = 'v',
})
wk.register({
	['ih'] = { '<cmd>C-U>lua require"gitsigns.actions".select_hunk()<cr>' },
}, { mode = 'o' })
wk.register({
	['ih'] = { '<cmd>C-U>lua require"gitsigns.actions".select_hunk()<cr>' },
}, { mode = 'x' })

-- Barbar
wk.register {
	['<A-,>'] = { '<cmd>BufferPrevious<cr>', 'Previous Buffer' },
	['<A-.>'] = { '<cmd>BufferNext<cr>', 'Next Buffer' },
	-- Re-order
	['<A-<>'] = { '<cmd>BufferMovePrevious<cr>', 'Re-Order Buffer To Previous' },
	['<A->>'] = { '<cmd>BufferMoveNext<cr>', 'Re-Order Buffer To Next' },
	-- Goto
	['<A-1>'] = { '<cmd>BufferGoto 1<cr>', 'Go To Buffer 1' },
	['<A-2>'] = { '<cmd>BufferGoto 2<cr>', 'Go To Buffer 2' },
	['<A-3>'] = { '<cmd>BufferGoto 3<cr>', 'Go To Buffer 3' },
	['<A-4>'] = { '<cmd>BufferGoto 4<cr>', 'Go To Buffer 4' },
	['<A-5>'] = { '<cmd>BufferGoto 5<cr>', 'Go To Buffer 5' },
	['<A-6>'] = { '<cmd>BufferGoto 6<cr>', 'Go To Buffer 6' },
	['<A-7>'] = { '<cmd>BufferGoto 7<cr>', 'Go To Buffer 7' },
	['<A-8>'] = { '<cmd>BufferGoto 8<cr>', 'Go To Buffer 8' },
	['<A-9>'] = { '<cmd>BufferGoto 9<cr>', 'Go To Buffer 9' },
	['<A-0>'] = { '<cmd>BufferLast<cr>', 'Go To Last Buffer' },
	--
	['<A-c>'] = { '<cmd>BufferClose<cr>', 'Close Buffer' },
	-- Magic buffer-picking mode
	['<C-p>'] = { '<cmd>BufferPick<cr>', 'Pick Buffer' },
	-- Sort automatically
	['<leader>b'] = {
		name = 'Order Buffers',
		b = { '<cmd>BufferOrderByBufferNumber<cr>', 'Order Buffers By Number' },
		d = { '<cmd>BufferOrderByDirectory<cr>', 'Order Buffers By Directory' },
		l = { '<cmd>BufferOrderByLanguage<cr>', 'Order Buffers By Language' },
	},
}
-- Trouble
wk.register {
	['<leader>x'] = {
		name = 'Diagnostics',
		x = { '<cmd>Trouble<cr>', 'Open Diagnostics' },
		w = { '<cmd>Trouble lsp_workspace_diagnostics<cr>', 'Open Workspace Diagnostics' },
		d = { '<cmd>Trouble lsp_document_diagnostics<cr>', 'Open Document Diagnostics' },
		l = { '<cmd>Trouble loclist<cr>', 'Open Location List' },
		q = { '<cmd>Trouble quickfix<cr>', 'Open Quickfix List' },
	},
	['gR'] = { '<cmd>Trouble lsp_references<cr>', 'LSP References' },
}
-- Zen Mode
wk.register {
	['<leader>z'] = { '<cmd>TZA<cr>', 'Zen Mode' },
}
-- Git diffing
wk.register {
	['<leader>'] = {

		d = { '<cmd>DiffviewOpen<cr>', 'Open Git Diff' },

		dq = { '<cmd>DiffviewClose<cr>', 'Close Git Diff' },
	},
}

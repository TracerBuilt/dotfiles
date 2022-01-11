local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local wk = require 'which-key'

-- Remap ESC key
map('i', 'jk', '<ESC>', { noremap = true })

-- LSP
wk.register {
	g = {
		d = { '<cmd>Telescope lsp_definitions<CR>', 'Go-To Defintion' },
		D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go-To Declaration' },
		i = { '<cmd>Telescope lsp_implementations<CR>', 'List All Implementations' },
		r = { '<cmd>Telescope lsp_references<CR>', 'List All References' },
		y = { '<cmd>Telescope lsp_type_definitions()<CR>', 'Go-To Type Definition' },
	},
	K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Display Hover Info' },
	['C-k'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Display Signature Info' },
	['<leader>'] = {
		rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename All References' },
		ca = { '<cmd>Telescope lsp_code_actions<CR>', 'Code Actions' },
		F = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format File' },
	},
}

-- nvim-tree
wk.register {
	['<C-n>'] = { '<cmd>lua require("ui.treetoggle").toggle()<CR>', 'Toggle File Tree' },
	['<leader>r'] = { '<cmd>NvimTreeRefresh<CR>', 'Refresh File Tree' },
	['<leader>n'] = { '<cmd>NvimTreeFindFile<CR>', 'Focus File Tree' },
}
-- Telescope
wk.register {
	['<leader>f'] = {
		name = 'File',
		f = { '<cmd>Telescope find_files<CR>', 'Find Files' },
		g = { '<cmd> Telescope live_grep<CR>', 'Live Grep' },
		b = { '<cmd>Telescope buffers<CR>', 'Find Buffers' },
		h = { '<cmd>Telescope help_tags<CR>', 'Help Tags' },
		o = { '<cmd>Telescope vim_options<CR>', 'Vim Options' },
		t = { '<cmd>Telescope treesitter<CR>', 'Treesitter Symbols' },
		c = { '<cmd>Telescope colorscheme<CR>', 'Color Schemes' },
		i = { '<cmd>Telescope highlights<CR>', 'Color Schemes' },

		G = {
			name = 'Git',
			c = { '<cmd>Telescope git_commits<CR>', 'List All Commits' },
			C = { '<cmd>Telescope git_bcommits<CR>', 'List Buffer Commits' },
			b = { '<cmd>Telescope git_branches<CR>', 'List Branches' },
			s = { '<cmd>Telescope git_status<CR>', 'List Current Changes' },
			S = { '<cmd>Telescope git_stash<CR>', 'List Stash Items' },
		},
	},
}
-- GitSigns
wk.register {
	[']c'] = { expr = true, '&diff ? "]c" : "<cmd>lua require\'gitsigns.actions\'.next_hunk()<CR>"', 'Next Hunk' },
	['[c'] = {
		expr = true,
		'&diff ? "[c" : "<cmd>lua require\'gitsigns.actions\'.prev_hunk()<CR>"',
		'Previous Hunk',
	},
	['<leader>h'] = {
		name = 'GitSigns Actions',
		['s'] = { '<cmd>lua require("gitsigns").stage_hunk<CR>', 'Stage Hunk' },
		['u'] = { '<cmd>lua require("gitsigns").undo_stage_hunk<CR>', 'Undo Stage Hunk' },
		['r'] = { '<cmd>lua require("gitsigns").reset_hunk<CR>', 'Reset Hunk' },
		['R'] = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset Buffer' },
		['p'] = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview Hunk' },
		['b'] = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', 'Blame Line' },
		['S'] = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', 'Stage Buffer' },
		['U'] = { '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', 'Reset Buffer' },
	},
}
wk.register({
	['<leader>h'] = {
		name = 'GitSigns Actions',
		s = { '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', 'Stage Hunk' },
		r = { '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', 'Reset Hunk' },
	},
}, {
	mode = 'v',
})
wk.register({
	['ih'] = { '<cmd>C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
}, { mode = 'o' })
wk.register({
	['ih'] = { '<cmd>C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
}, { mode = 'x' })

-- Barbar
wk.register {
	['<A-,>'] = { '<cmd>BufferPrevious<CR>', 'Previous Buffer' },
	['<A-.>'] = { '<cmd>BufferNext<CR>', 'Next Buffer' },
	-- Re-order
	['<A-<>'] = { '<cmd>BufferMovePrevious<CR>', 'Re-Order Buffer To Previous' },
	['<A->>'] = { '<cmd>BufferMoveNext<CR>', 'Re-Order Buffer To Next' },
	-- Goto
	['<A-1>'] = { '<cmd>BufferGoto 1<CR>', 'Go To Buffer 1' },
	['<A-2>'] = { '<cmd>BufferGoto 2<CR>', 'Go To Buffer 2' },
	['<A-3>'] = { '<cmd>BufferGoto 3<CR>', 'Go To Buffer 3' },
	['<A-4>'] = { '<cmd>BufferGoto 4<CR>', 'Go To Buffer 4' },
	['<A-5>'] = { '<cmd>BufferGoto 5<CR>', 'Go To Buffer 5' },
	['<A-6>'] = { '<cmd>BufferGoto 6<CR>', 'Go To Buffer 6' },
	['<A-7>'] = { '<cmd>BufferGoto 7<CR>', 'Go To Buffer 7' },
	['<A-8>'] = { '<cmd>BufferGoto 8<CR>', 'Go To Buffer 8' },
	['<A-9>'] = { '<cmd>BufferGoto 9<CR>', 'Go To Buffer 9' },
	['<A-0>'] = { '<cmd>BufferLast<CR>', 'Go To Last Buffer' },
	--
	['<A-c>'] = { '<cmd>BufferClose<CR>', 'Close Buffer' },
	-- Magic buffer-picking mode
	['<C-p>'] = { '<cmd>BufferPick<CR>', 'Pick Buffer' },
	-- Sort automatically
	['<leader>b'] = {
		name = 'Order Buffers',
		b = { '<cmd>BufferOrderByBufferNumber<CR>', 'Order Buffers By Number' },
		d = { '<cmd>BufferOrderByDirectory<CR>', 'Order Buffers By Directory' },
		l = { '<cmd>BufferOrderByLanguage<CR>', 'Order Buffers By Language' },
	},
}
-- Trouble
wk.register {
	['<leader>x'] = {
		name = 'Diagnostics',
		x = { '<cmd>Trouble<CR>', 'Open Diagnostics' },
		w = { '<cmd>Trouble lsp_workspace_diagnostics<CR>', 'Open Workspace Diagnostics' },
		d = { '<cmd>Trouble lsp_document_diagnostics<CR>', 'Open Document Diagnostics' },
		l = { '<cmd>Trouble loclist<CR>', 'Open Location List' },
		q = { '<cmd>Trouble quickfix<CR>', 'Open Quickfix List' },
	},
	['gR'] = { '<cmd>Trouble lsp_references<CR>', 'LSP References' },
}
-- Zen Mode
wk.register {
	['<leader>z'] = { '<cmd>ZenMode<CR>', 'Zen Mode' },
}
-- Git diffing
wk.register {
	['<leader>'] = {

		d = { '<cmd>DiffviewOpen<CR>', 'Open Git Diff' },

		dq = { '<cmd>DiffviewClose<CR>', 'Close Git Diff' },
	},
}

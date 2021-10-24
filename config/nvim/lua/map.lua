local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local wk = require 'which-key'

-- Remap ESC key
map('i', 'jk', '<ESC>', { noremap = true })

wk.register {
	g = {
		d = { ':lua require("telescope.builtin").lsp_definitions()<cr>', 'Go-To Defintion' },
		D = { ':lua vim.lsp.buf.declaration()<cr>', 'Go-To Declaration' },
		i = { ':lua require("telescope.builtin").lsp_implementations()<cr>', 'List All Implementations' },
		r = { ':lua require("telescope.builtin").lsp_references()<cr>', 'List All References' },
		t = { ':lua require("telescope.builtin").lsp_type_definitions()<cr>', 'Go-To Type Definition' },
	},
	K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Display Hover Info' },
	['C-k'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Display Signature Info' },
	['<leader>'] = {
		w = {
			a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder' },
			r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder' },
			l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders' },
		},
		rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename All References' },
		ca = { ':lua require("telescope.builtin").lsp_code_actions()<cr>', 'Code Actions' },
		f = { ':lua vim.lsp.buf.formatting()<cr>', 'Format File' },
	},
}

-- nvim-tree
wk.register {
	['<C-n>'] = { ':lua require("configs.treetoggle").toggle()<cr>', 'Toggle File Tree' },
	['<leader>r'] = { ':NvimTreeRefresh<cr>', 'Refresh File Tree' },
	['<leader>n'] = { ':NvimTreeFindFile<cr>', 'Focus File Tree' },
}
-- Telescope
wk.register {
	['<leader>f'] = {
		name = 'File',
		f = { ':lua require("telescope.builtin").find_files()<cr>', 'Find Files' },
		g = { ':lua require("telescope.builtin").live_grep()<cr>', 'Live Grep' },
		b = { ':lua require("telescope.builtin").buffers()<cr>', 'Find Buffers' },
		h = { ':lua require("telescope.builtin").help_tags()<cr>', 'Help Tags' },
		o = { ':lua require("telescope.builtin").vim_options()<cr>', 'Vim Options' },
		t = { ':lua require("telescope.builtin").treesitter()<cr>', 'Vim Options' },
		G = {
			name = 'Git',
			c = { ':lua require("telescope.builtin").git_commits()<cr>', 'List All Commits' },
			C = { ':lua require("telescope.builtin").git_commits()<cr>', 'List Buffer Commits' },
			b = { ':lua require("telescope.builtin").git_branches()<cr>', 'List Branches' },
			s = { ':lua require("telescope.builtin").git_status()<cr>', 'List Current Changes' },
			S = { ':lua require("telescope.builtin").git_stash()<cr>', 'List Stash Items' },
		},
	},
}
-- GitSigns
wk.register {
	[']c'] = { expr = true, '&diff ? "]c" : ":lua require\'gitsigns.actions\'.next_hunk()<cr>"', 'Next Hunk' },
	['[c'] = {
		expr = true,
		'&diff ? "[c" : ":lua require\'gitsigns.actions\'.prev_hunk()<cr>"',
		'Previous Hunk',
	},
	['<leader>h'] = {
		name = 'GitSigns Actions',
		['s'] = { ':lua require("gitsigns").stage_hunk<cr>', 'Stage Hunk' },
		['u'] = { ':lua require("gitsigns").undo_stage_hunk<cr>', 'Undo Stage Hunk' },
		['r'] = { ':lua require("gitsigns").reset_hunk<cr>', 'Reset Hunk' },
		['R'] = { ':lua require"gitsigns".reset_buffer()<cr>', 'Reset Buffer' },
		['p'] = { ':lua require"gitsigns".preview_hunk()<cr>', 'Preview Hunk' },
		['b'] = { ':lua require"gitsigns".blame_line(true)<cr>', 'Blame Line' },
		['S'] = { ':lua require"gitsigns".stage_buffer()<cr>', 'Stage Buffer' },
		['U'] = { ':lua require"gitsigns".reset_buffer_index()<cr>', 'Reset Buffer' },
	},
}
wk.register({
	['<leader>h'] = {
		name = 'GitSigns Actions',
		s = { ':lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Stage Hunk' },
		r = { ':lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Reset Hunk' },
	},
}, {
	mode = 'v',
})
wk.register({
	['ih'] = { ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
}, { mode = 'o' })
wk.register({
	['ih'] = { ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>' },
}, { mode = 'x' })

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
		name = 'Order Buffers',
		bb = { ':BufferOrderByBufferNumber<cr>', 'Order Buffers By Number' },
		bd = { ':BufferOrderByDirectory<cr>', 'Order Buffers By Directory' },
		bl = { ':BufferOrderByLanguage<cr>', 'Order Buffers By Language' },
	},
}
-- Trouble
wk.register {
	['<leader>x'] = {
		name = 'Diagnostics',
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
-- Dashboard
wk.register {
	['<leader>'] = {
		ss = { ':<C-u>SessionSave<cr>', 'Save Session' },
		sl = { ':<C-u>SessionLoad<cr>', 'Load Session' },
		tc = { ':DashboardChangeColorscheme<cr>', 'Change Colorscheme' },
		fa = { ':DashboardFindWord<cr>', 'Find Word' },
		fb = { ':DashboardJumpMark<cr>', 'Jump Mark' },
		cn = { 'DashboardNewFile<cr>', 'New File' },
	},
}

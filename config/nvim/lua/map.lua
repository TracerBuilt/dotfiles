local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local wk = require 'which-key'

-- Remap ESC key
map('i', 'jk', '<ESC>', { noremap = true })

-- LSP
wk.register {
	g = {
		d = { '<cmd>lua require("telescope.builtin").lsp_definitions{}<CR>', 'Go-To Defintion' },
		D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go-To Declaration' },
		i = { '<cmd>lua require("telescope.builtin").lsp_implementations{}<CR>', 'List All Implementations' },
		r = { '<cmd>lua require("telescope.builtin").lsp_references{}<CR>', 'List All References' },
		y = { '<cmd>lua require("telescope.builtin").lsp_type_definitions{}<CR>', 'Go-To Type Definition' },
	},
	K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Display Hover Info' },
	['C-k'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Display Signature Info' },
	['<leader>'] = {
		rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename All References' },
		ca = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Actions' },
		F = { '<cmd>lua vim.lsp.buf.format { async = true}<CR>', 'Format File' },
	},
}

-- nvim-tree
wk.register {
	['<C-n>'] = { '<cmd>Neotree toggle<CR>', 'Toggle File Tree' },
	['<leader>n'] = { '<cmd>Neotree<CR>', 'Focus File Tree' },
}
-- Telescope
wk.register {
	['<leader>f'] = {
		name = 'File',
		f = { '<cmd>lua require("telescope.builtin").find_files{}<CR>', 'Find Files' },
		g = { '<cmd>lua require("telescope.builtin").live_grep{}<CR>', 'Live Grep' },
		b = { '<cmd>lua require("telescope.builtin").buffers{}<CR>', 'Find Buffers' },
		h = { '<cmd>lua require("telescope.builtin").help_tags{}<CR>', 'Help Tags' },
		o = { '<cmd>lua require("telescope.builtin").vim_options{}<CR>', 'Vim Options' },
		t = { '<cmd>lua require("telescope.builtin").treesitter{}<CR>', 'Treesitter Symbols' },
		c = { '<cmd>lua require("telescope.builtin").colorscheme{}<CR>', 'Color Schemes' },
		i = { '<cmd>lua require("telescope.builtin").highlights{}<CR>', 'Color Schemes' },

		G = {
			name = 'Git',
			c = { '<cmd>lua require("telescope.builtin").git_commits{}<CR>', 'List All Commits' },
			C = { '<cmd>lua require("telescope.builtin").git_bcommits{}<CR>', 'List Buffer Commits' },
			b = { '<cmd>lua require("telescope.builtin").git_branches{}<CR>', 'List Branches' },
			s = { '<cmd>lua require("telescope.builtin").git_status{}<CR>', 'List Current Changes' },
			S = { '<cmd>lua require("telescope.builtin").git_stash{}<CR>', 'List Stash Items' },
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
	['<leader>g'] = {
		name = 'GitSigns Actions',
		s = { '<cmd>lua require("gitsigns").stage_hunk<CR>', 'Stage Hunk' },
		u = { '<cmd>lua require("gitsigns").undo_stage_hunk<CR>', 'Undo Stage Hunk' },
		r = { '<cmd>lua require("gitsigns").reset_hunk<CR>', 'Reset Hunk' },
		R = { '<cmd>lua require("gitsigns").reset_buffer()<CR>', 'Reset Buffer' },
		p = { '<cmd>lua require("gitsigns").preview_hunk()<CR>', 'Preview Hunk' },
		b = { '<cmd>lua require("gitsigns").blame_line(true)<CR>', 'Blame Line' },
		S = { '<cmd>lua require("gitsigns").stage_buffer()<CR>', 'Stage Buffer' },
		U = { '<cmd>lua require("gitsigns").reset_buffer_index()<CR>', 'Reset Buffer' },
	},
}
wk.register({
	['<leader>g'] = {
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

-- Bufferline
wk.register {
	['<A-,>'] = { '<cmd>BufferLineCyclePrev<CR>', 'Previous Buffer' },
	['<A-.>'] = { '<cmd>BufferLineCycleNext<CR>', 'Next Buffer' },
	-- Re-order
	['<A-<>'] = { '<cmd>BufferLineMovePrev<CR>', 'Re-Order Buffer To Previous' },
	['<A->>'] = { '<cmd>BufferLineMoveNext<CR>', 'Re-Order Buffer To Next' },
	-- Goto
	['<A-1>'] = { '<cmd>BufferLineGoToBuffer 1<CR>', 'Go To Buffer 1' },
	['<A-2>'] = { '<cmd>BufferLineGoToBuffer 2<CR>', 'Go To Buffer 2' },
	['<A-3>'] = { '<cmd>BufferLineGoToBuffer 3<CR>', 'Go To Buffer 3' },
	['<A-4>'] = { '<cmd>BufferLineGoToBuffer 4<CR>', 'Go To Buffer 4' },
	['<A-5>'] = { '<cmd>BufferLineGoToBuffer 5<CR>', 'Go To Buffer 5' },
	['<A-6>'] = { '<cmd>BufferLineGoToBuffer 6<CR>', 'Go To Buffer 6' },
	['<A-7>'] = { '<cmd>BufferLineGoToBuffer 7<CR>', 'Go To Buffer 7' },
	['<A-8>'] = { '<cmd>BufferLineGoToBuffer 8<CR>', 'Go To Buffer 8' },
	['<A-9>'] = { '<cmd>BufferLineGoToBuffer 9<CR>', 'Go To Buffer 9' },
	-- Closing buffers
	['<A-c>'] = { '<cmd>BufferLinePickClose<CR>', 'Close Picked Buffer' },
	['<A-h>'] = { '<cmd>BufferLineCloseLeft<CR>', 'Close Left Buffers' },
	['<A-l>'] = { '<cmd>BufferLineCloseRight<CR>', 'Close Right Buffers' },
	-- Magic buffer-picking mode
	['<C-p>'] = { '<cmd>BufferLinePick<CR>', 'Pick Buffer' },
	-- Sort automatically
	['<leader>b'] = {
		name = 'Sort Buffers',
		e = { '<cmd>BufferLineSortByExtension<CR>', 'Sort By Extension' },
		d = { '<cmd>BufferLineSortByDirectory<CR>', 'Sort By Directory' },
		t = { '<cmd>BufferLineSortByTabs<CR>', 'Sort By Tabs' },
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
-- Leap

wk.register {
	s = {
		function()
			require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
		end,
		'Leap',
	},
}
-- Window management
wk.register {
	['<c-l>'] = { '<cmd>FocusSplitNicely<CR>', 'Focus Split Nicely' },
	['<leader>'] = {
		h = { '<cmd>FocusSplitLeft<CR>', 'Focus Split Left' },
		j = { '<cmd>FocusSplitDown<CR>', 'Focus Split Down' },
		k = { '<cmd>FocusSplitUp<CR>', 'Focus Split Up' },
		l = { '<cmd>FocusSplitRight<CR>', 'Focus Split Right' },
	},
}

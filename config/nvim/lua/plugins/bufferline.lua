return {
	'Theyashsawarkar/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup {
			options = {
				themable = true,
				diagnostics = 'nvim_lsp',
				separator_style = 'thin',
				hover = {
					enabled = true,
					delay = 0,
					reveal = { 'close' },
				},
				offsets = {
					{
						filetype = 'neo-tree',
						text = function()
							return string.sub(vim.fn.getcwd(), vim.fn.getcwd():match '^.*()/')
						end,
						text_align = 'center',
						separator = true,
					},
				},
			},
		}

		local wk = require 'which-key'

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
	end,
}

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })

		local minifiles_toggle = function()
			local mini_files = require 'mini.files'
			if not mini_files.close() then
				mini_files.open(vim.uv.cwd(), true)
			end
		end

			map("n", '<C-n>', minifiles_toggle, { desc = 'Toggle file tree' })
			
				map("n", '<leader>n', function() require('mini.files').open(vim.api.nvim_buf_get_name(0), trur) end, { desc = 'Open file tree (directory of current file)'})
				map( 'n', '<leader>N', function() require('mini.files').open(vim.uv.cwd(), true) end,
  {desc = 'Open file tree (cwd)' }
			)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

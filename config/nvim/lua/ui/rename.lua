local function highlight(group, bg, fg, gui)
	if gui ~= nil and gui ~= '' then
		vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s gui=%s', group, bg, fg, gui))
	else
		vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s', group, bg, fg))
	end
end
local M = {}

local api = vim.api
local lsp = vim.lsp
local buf, win
local prompt_str = '  '

function M.rename()
	local map_opts = { noremap = true, silent = true }
	local opts = {
		style = 'minimal',
		border = 'single',
		relative = 'cursor',
		width = 25,
		height = 1,
		row = 1,
		col = 1,
	}
	buf, win = api.nvim_create_buf(false, true)
	api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	api.nvim_open_win(buf, true, opts)
	api.nvim_win_set_option(win, 'scrolloff', 0)
	api.nvim_win_set_option(win, 'sidescrolloff', 0)
	api.nvim_buf_set_option(buf, 'modifiable', true)
	api.nvim_buf_set_option(buf, 'buftype', 'prompt')
	api.nvim_buf_add_highlight(buf, -1, 'LspRenamePrompt', 0, 0, #prompt_str)
	highlight('LspRenamePrompt', 'None', '#c678dd')

	vim.fn.prompt_setprompt(buf, prompt_str)

	vim.api.nvim_command 'startinsert!'
	api.nvim_buf_set_keymap(buf, 'i', '<esc>', '<CMD>stopinsert <BAR> q!<CR>', map_opts)
	api.nvim_buf_set_keymap(buf, 'i', '<CR>', "<CMD>stopinsert <BAR> lua require('ui.rename')._rename()<CR>", map_opts)

	function M._rename()
		local newName = vim.trim(vim.fn.getline('.'):sub(5, -1))
		vim.cmd [[q!]]
		local params = lsp.util.make_position_params()
		local currName = vim.fn.expand '<cword>'
		if not (newName and #newName > 0) or newName == currName then
			return
		end
		params.newName = newName
		lsp.buf_request(0, 'textDocument/rename', params)
	end
end

return M

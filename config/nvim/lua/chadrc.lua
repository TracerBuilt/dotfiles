-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = 'kanagawa',
	transparency = true,

	cmp = {
		style = 'atom',
	},

	telescope = { style = 'borderless' }, -- borderless / bordered

	lsp = { signature = false },

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M

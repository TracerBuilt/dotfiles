-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = 'kanagawa',
	theme_toggle = { 'kanagawa', 'github_light' },
	transparency = true,
}

M.ui = {

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

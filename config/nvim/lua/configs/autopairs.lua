require('nvim-autopairs').setup {
	disable_filetype = { 'TelescopePrompt', 'terminal', 'Packer' },
	check_ts = true,
	enable_check_bracket_line = false,
	ts_config = {},
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

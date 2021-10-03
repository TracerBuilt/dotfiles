local Rule = require 'nvim-autopairs.rule'
local npairs = require 'nvim-autopairs'

npairs.setup {
	check_ts = true,
	enable_check_bracket_line = false,
	ts_config = {},
}

require('nvim-treesitter.configs').setup {
	autopairs = { enable = true },
}

local ts_conds = require 'nvim-autopairs.ts-conds'

-- press % => %% is only inside comment or string
npairs.add_rules {
	Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node { 'string', 'comment' }),
	Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node { 'function' }),
}

-- you need setup cmp first put this after cmp.setup()
require('nvim-autopairs.completion.cmp').setup {
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
	auto_select = true, -- automatically select the first item
	insert = false, -- use insert confirm behavior instead of replace
	map_char = { -- modifies the function or method delimiter by filetypes
		all = '(',
		tex = '{',
	},
}

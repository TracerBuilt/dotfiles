local luasnip = require 'luasnip'

require('luasnip.config').setup {
	history = true,
}

require('luasnip.loaders.from_vscode').load {}

local wk = require 'which-key'

wk.register {
	jk = { '<ESC>', 'Exit Insert Mode', mode = 'i', noremap = true },
}

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

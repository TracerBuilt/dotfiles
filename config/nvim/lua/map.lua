local wk = require 'which-key'

wk.register {
	jk = { '<ESC>', 'Exit Insert Mode', mode = 'i', noremap = true },
}

wk.register({
	j = { "v:count == 0 ? 'gj' : 'j'" },
	k = { "v:count == 0 ? 'gk' : 'k'" },
}, { noremap = true, expr = true, silent = true })

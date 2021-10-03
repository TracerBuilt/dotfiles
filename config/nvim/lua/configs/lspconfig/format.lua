local eslint = {
	lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
	lintStdin = true,
	lintFormats = { '%f:%l:%c: %m' },
	lintIgnoreExitCode = true,
	formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
	formatStdin = true,
}

local stylelint = {
	lintCommand = 'stylelint --stdin --stdin-filename ${INPUT} --formatter compact',
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = {
		'%f: line %l, col %c, %tarning - %m',
		'%f: line %l, col %c, %trror - %m',
	},
	formatCommand = 'stylelint --fix --stdin --stdin-filename ${INPUT}',
	formatStdin = true,
}

local prettier = {
	formatCommand = 'prettier --plugin-search-dir=. --stdin --stdin-filepath ${INPUT}',
	formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

return {
	css = { prettier, stylelint },
	scss = { prettier, stylelint },
	html = { prettier, stylelint },
	javascript = { prettier, eslint },
	javascriptreact = { prettier, stylelint, eslint },
	['javascript.jsx'] = { prettier, stylelint, eslint },
	typescript = { prettier, eslint },
	typescriptreact = { prettier, stylelint, eslint },
	['typescript.tsx'] = { prettier, stylelint, eslint },
	svelte = { prettier, stylelint, eslint },
	json = { prettier },
	lua = { stylua },
	markdown = { prettier },
	yaml = { prettier },
}

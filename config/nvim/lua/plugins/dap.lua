local dap = require 'dap'

dap.adapters.chrome = {
	type = 'executable',
	command = 'node',
	args = { os.getenv 'HOME' .. '.config/nvim/vscode-chrome-debug/out/src/chromeDebug.js' },
}

dap.configurations.javascript = { -- change this to javascript if needed
	{
		type = 'chrome',
		request = 'attach',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		port = 9222,
		webRoot = '${workspaceFolder}',
	},
}

dap.configurations.typescript = { -- change to typescript if needed
	{
		type = 'chrome',
		request = 'attach',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		port = 9222,
		webRoot = '${workspaceFolder}',
	},
}

return {

	'yetone/avante.nvim',
	event = 'VeryLazy',
	lazy = false,
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		file_selector = {
			provider = 'snacks',
		},

		provider = 'gemini',
		gemini = {
			model = 'gemini-2.0-flash',
		},

		vendors = {
			huggingface = {
				__inherited_from = 'openai',
				endpoint = 'https://api-inference.huggingface.co/models',
				model = 'deepseek-ai/DeepSeek-V3',
				api_key_name = 'HUGGINGFACE_INFERENCE_TOKEN',
				parse_curl_args = function(opts)
					return vim.tbl_deep_extend('force', opts, {
						url = opts.endpoint .. '/' .. opts.model,
					})
				end,
			},
		},

		web_search_engine = {
			provider = 'google',
		},

		behaviour = {
			auto_suggestions = false,
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = 'make',

	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		'stevearc/dressing.nvim',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'saghen/blink.cmp',
		opts = {
			sources = {
				compat = {
					'avante_commands',
					'avante_mentions',
					'avante_files',
				},
			},
		},
		{
			-- support for image pasting
			'HakonHarnes/img-clip.nvim',
			event = 'VeryLazy',
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { 'markdown', 'Avante' },
			},
			ft = { 'markdown', 'Avante' },
		},
	},
}

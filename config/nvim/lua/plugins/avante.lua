return {

	'yetone/avante.nvim',
	event = 'VeryLazy',
	lazy = false,
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {

		provider = 'openrouter_deepseek',
		auto_suggestions_provider = 'openrouter_qemini_flash_lite',

		web_search_engine = {
			provider = 'google',
		},

		vendors = {
			openrouter_deepseek = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'deepseek/deepseek-r1-zero:free',
			},
			openrouter_qemini_flash_lite = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'google/gemini-2.0-flash-lite-preview-02-05:free',
			},
			openrouter_qemini_pro = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'google/gemini-2.0-pro-exp-02-05:free',
			},
			openrouter_qwq = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'qwen/qwq-32b:free',
			},
			groq = {
				__inherited_from = 'openai',
				api_key_name = 'GROQ_API_KEY',
				endpoint = 'https://api.groq.com/openai/v1/',
				model = 'qwen-qwq-32b',
			},
		},

		dual_boost = {
			enabled = true,
			first_provider = 'openrouter_deepseek',
			second_provider = 'openrouter_gemini_pro',
		},

		behaviour = {
			auto_suggestions = true,
			enable_cursor_planning_mode = true,
		},

		file_selector = {
			provider = 'snacks',
		},
		suggestion = {
			debounce = 400,
			throttle = 400,
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = 'make',

	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		'stevearc/dressing.nvim',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		{
			'saghen/blink.cmp',
			dependencies = {
				'saghen/blink.compat',
				optional = false,
			},
			opts = {
				sources = {
					-- adding any nvim-cmp sources here will enable them
					-- with blink.compat
					compat = {
						'avante_commands',
						'avante_mentions',
						'avante_files',
					},
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

return {

	'yetone/avante.nvim',
	event = 'VeryLazy',
	lazy = false,
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {

		provider = 'gemini',
		cursor_applying_provider = 'gemini',

		web_search_engine = {
			provider = 'google',
		},

		vendors = {
			gemini = {
				__inherited_from = 'gemini',
				model = 'gemini-2.0-flash',
			},
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
			groq_llama_versatile = {
				__inherited_from = 'openai',
				api_key_name = 'GROQ_API_KEY',
				endpoint = 'https://api.groq.com/openai/v1/',
				model = 'llama-3.3-70b-versatile',
				max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
			},
			groq_deepseek_distill_qwen = {
				__inherited_from = 'openai',
				api_key_name = 'GROQ_API_KEY',
				endpoint = 'https://api.groq.com/openai/v1/',
				model = 'deepseek-r1-distill-qwen-32b',
			},
			groq_deepseek_distill_llama = {
				__inherited_from = 'openai',
				api_key_name = 'GROQ_API_KEY',
				endpoint = 'https://api.groq.com/openai/v1/',
				model = 'deepseek-r1-distill-llama-70b',
			},
		},

		dual_boost = {
			enabled = false,
			first_provider = 'groq_deepseek_distill_llama',
			second_provider = 'groq_deepseek_distill_qwen',
		},

		behaviour = {
			auto_suggestions = false,
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

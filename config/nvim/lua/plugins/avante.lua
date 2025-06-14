return {

	'yetone/avante.nvim',
	event = 'VeryLazy',
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {

		provider = 'gemini_pro',
		cursor_applying_provider = 'gemini_flash_lite',

		web_search_engine = {
			provider = 'tavily',
		},

		vendors = {
			gemini_pro = {
				__inherited_from = 'gemini',
				model = 'gemini-2.5-pro-exp-03-25',
			},
			gemini_flash = {
				__inherited_from = 'gemini',
				model = 'gemini-2.0-flash',
			},
			gemini_flash_lite = {
				__inherited_from = 'gemini',
				model = 'gemini-2.0-flash-lite',
			},
			openrouter_deepseek = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'deepseek/deepseek-chat-v3-0324:free',
			},
			openrouter_gemini_pro = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'google/gemini-2.5-pro-exp-03-25:free',
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

		rag_service = {
			enabled = true,
			host_mount = os.getenv 'HOME' .. '/Projects',
			provider = 'ollama',
			llm_model = 'llama3.1',
			endpoint = 'http://localhost:8080',
		},

		dual_boost = {
			enabled = false,
			first_provider = 'gemini',
			second_provider = 'gemini_flash',
		},

		behaviour = {
			auto_suggestions = false,
			enable_cursor_planning_mode = true,
		},

		mappings = {
			suggestion = {
				accept = '<Tab>',
				next = '<M-l>',
				previous = '<M-h>',
			},
		},

		selector = {
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
		'nvim-treesitter/nvim-treesitter',
		'stevearc/dressing.nvim',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		{
			'saghen/blink.cmp',
			dependencies = {
				'Kaiser-Yang/blink-cmp-avante',
			},
			opts = {
				sources = {
					default = { 'avante' },
					providers = {
						avante = {
							module = 'blink-cmp-avante',
							name = 'Avante',
							opts = {},
						},
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

return {
	dependencies = {
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	opts = {
		-- See Configuration section for optionoos
		window = {
			layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
			width = 0.35, -- fractional width of parent, or absolute width in columns when > 1
			height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
			-- Options below only apply to floating windows
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
			blend = 0, -- window blend (transparency), 0-100, 0 is opaque, 100 is fully transparent
		},

		headers = {
			user = "👤 You: ",
			assistant = "🤖 Copilot: ",
			tool = "🔧 Tool: ",
		},
		separator = "━━",
		show_folds = false, -- Disable folding for cleaner look
		model = "claude-sonnet-4", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
		tools = nil, -- Default tool or array of tools (or groups) to share with LLM (can be specified manually in prompt via @).
		sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat (can be specified manually in prompt via >).
		language = "Chinese", -- Default language to use for answers
		{
			-- Use visual selection, fallback to current line
			selection = function(source)
				return require("CopilotChat.select").visual(source) or require("CopilotChat.select").line(source)
			end,
		},
	},
}

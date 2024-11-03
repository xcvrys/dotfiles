return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
		provider = "copilot",
		system_prompt = "You are an AI copilot designed to assist users in software development. Your primary role is to provide guidance, answer questions, and generate code snippets in a clear and concise manner without unnecessary explanations. Avoid spamming comments; instead, categorize your responses for better clarity and organization. Communicate in a friendly and professional tone, ensuring you understand the user’s context and needs. Be proactive in offering suggestions or asking clarifying questions to enhance the user’s experience",
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

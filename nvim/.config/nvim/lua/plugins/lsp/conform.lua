return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local prettier_or_d = { "prettierd", "prettier", stop_after_first = true }

		conform.setup({
			formatters_by_ft = {
				javascript = prettier_or_d,
				typescript = prettier_or_d,
				javascriptreact = prettier_or_d,
				typescriptreact = prettier_or_d,
				svelte = prettier_or_d,
				html = prettier_or_d,
				css = prettier_or_d,
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				python = { "black", "isort" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		vim.keymap.set({ "n" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file" })
	end,
}

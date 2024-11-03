return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				go = { "gofumpt", "golines", "goimports-reviser" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				yaml = { "yamlfmt" },
				-- templ = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}

-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufWritePre" },
-- 	cmd = { "ConformInfo" },
-- 	keys = {
-- 		{
-- 			"<leader>f",
-- 			function()
-- 				require("conform").format({ async = true })
-- 			end,
-- 			mode = "",
-- 			desc = "Format buffer",
-- 		},
-- 	},
-- 	opts = {
-- 		-- Define your formatters
-- 		formatters_by_ft = {
-- 			lua = { "stylua" },
-- 			python = { "isort", "black" },
-- 			javascript = { "prettierd", "prettier", stop_after_first = true },
-- 		},
--
-- 		-- Set default options
-- 		default_format_opts = {
-- 			lsp_format = "fallback",
-- 		},
--
-- 		-- Set up format-on-save
-- 		format_on_save = { timeout_ms = 500 },
--
-- 		-- Customize formatters
-- 		formatters = {
-- 			shfmt = {
-- 				prepend_args = { "-i", "2" },
-- 			},
-- 		},
-- 	},
-- 	init = function()
-- 		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
-- 	end,
-- }

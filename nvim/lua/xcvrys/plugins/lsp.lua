return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"templ",
					"html",
					"cssls",
					"emmet_language_server",
					"tailwindcss",
					"ts_ls",
					"pylsp",
					"clangd",
					"prismals",
					"yamlls",
					"jsonls",
					"eslint",
					"zls",
					"marksman",
					"sqlls",
					"wgsl_analyzer",
					"svelte",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function setup_server(server_name, extra_config)
				local config = { capabilities = capabilities }
				if extra_config then
					vim.tbl_extend("force", config, extra_config)
				end
				lspconfig[server_name].setup(config)
			end

			-- Language server configurations
			setup_server("zls", { cmd = { "zls" } })
			setup_server("gopls", {
				cmd = { "gopls" },
				root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
				filetypes = {
					"go",
					"gomod",
					"gowork",
					"gotmpl",
				},
				settings = {
					gopls = {
						completeunimported = true,
						usePlaceholders = true,
						analyses = { unusedparams = true },
					},
				},
			})
			setup_server("lua_ls")
			setup_server("wgsl_analyzer")
			setup_server("jsonls")
			setup_server("cssls")
			setup_server("prismals")
			setup_server("yamlls")
			setup_server("html", {
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			setup_server("emmet_language_server", {
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
					"markdown",
				},
			})
			setup_server("tailwindcss", {
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
				root_dir = lspconfig.util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.mjs",
					"tailwind.config.ts",
					"postcss.config.js",
					"postcss.config.cjs",
					"postcss.config.mjs",
					"postcss.config.ts",
					"package.json",
					"node_modules",
					".git"
				),
			})
			setup_server("templ", { filetypes = { "templ" } })

			-- TypeScript server setup
			local configs = require("lspconfig.configs")
			if not configs.ts_ls then
				configs.ts_ls = {
					default_config = {
						capabilities = capabilities,
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
					},
				}
			end
			setup_server("ts_ls")

			-- ESLint server setup
			setup_server("eslint")

			-- Clangd server setup
			setup_server("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--pch-storage=memory",
					"--all-scopes-completion",
					"--pretty",
					"--header-insertion=never",
					"-j=4",
					"--inlay-hints",
					"--header-insertion-decorators",
					"--function-arg-placeholders",
					"--completion-style=detailed",
				},
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = lspconfig.util.root_pattern("src"),
				init_options = { fallbackFlags = { "-std=c++2a" } },
			})

			-- Python setup
			local function get_python_path()
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					return venv_path .. "/bin/python3"
				end

				local os_name = function()
					local uname = vim.loop.os_uname()
					return uname.sysname == "Windows_NT" and "windows"
						or (uname.sysname == "Darwin" and "mac" or "linux")
				end

				if os_name() == "windows" then
					return "C:/python312"
				elseif os_name() == "linux" then
					return "/usr/bin/python3"
				end
				return nil
			end

			setup_server("pylsp", {
				settings = {
					python = {
						pythonPath = get_python_path(),
					},
				},
			})

			-- Additional servers
			setup_server("marksman")
			setup_server("gleam")

			-- Svelte setup
			setup_server("svelte", {
				cmd = { "svelte-language-server", "--stdio" },
				filetypes = { "svelte" },
				root_dir = lspconfig.util.root_pattern("svelte.config.js", "package.json", ".git"),
			})

			local keymap = vim.keymap

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					opts.desc = "Show LSP references"
					keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

					opts.desc = "Go to declaration"
					keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

					opts.desc = "Show LSP definitions"
					keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

					opts.desc = "Show LSP implementations"
					keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

					opts.desc = "Show LSP type definitions"
					keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

					opts.desc = "Smart rename"
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Go to previous diagnostic"
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

					opts.desc = "Go to next diagnostic"
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>lsr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			})
		end,
	},
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"yamlls",
				"eslint",
				"marksman",
				"svelte",
				"pyright",
				"rust_analyzer",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lspconfig = require("lspconfig")

			-- Enhanced capabilities with nvim-cmp integration
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)



			local signs = {
				Error = "E ",
				Warning = "W ",
				Hint = "H ",
				Information = "I "
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Custom border configuration for LSP windows
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			---@diagnostic disable-next-line: duplicate-set-field
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or {
					{ '┌', 'FloatBorder' },
					{ '─', 'FloatBorder' },
					{ '┐', 'FloatBorder' },
					{ '│', 'FloatBorder' },
					{ '┘', 'FloatBorder' },
					{ '─', 'FloatBorder' },
					{ '└', 'FloatBorder' },
					{ '│', 'FloatBorder' },
				}
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- Common on_attach function for all LSP servers
			local on_attach = function(_, bufnr)
				-- Enable navic for breadcrumbs

				-- Key mappings
				local opts = { buffer = bufnr, silent = true }

				vim.keymap.set('n', '<leader>ca', function()
					vim.lsp.buf.code_action()
				end, opts)

				-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
				-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
				-- vim.keymap.set('n', '<leader>wl', function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, opts)
				-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
				-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				-- vim.keymap.set('n', '<leader>f', function()
				-- 	vim.lsp.buf.format { async = true }
				-- end, opts)
			end

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = false,
				float = {
					focusable = false,
					style = 'minimal',
					border = 'rounded',
					source = true,
					header = '',
					prefix = '',
				},
			})

			-- Server-specific configurations
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = 'LuaJIT' },
							diagnostics = { globals = { 'vim' } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
						}
					}
				},
				ts_ls = {
					filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'  },
				},
				html = {
					filetypes = { 'html',  'vue', 'templ' }
				},
				cssls = {
					filetypes = { 'css', 'scss'  }
				},
				tailwindcss = {
					filetypes = { 'html', 'css', 'javascript', 'typescript', 'svelte', 'vue', 'javascriptreact', 'typescriptreact' },
					init_options = {
						userLanguages = {
							svelte = "html",
						}
					}
				},
				emmet_ls = {
					filetypes = { 'html', 'css', 'svelte', 'vue', 'templ', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }
				},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "https://www.schemastore.org/api/json/catalog.json"
							}
						}
					}
				},
				jsonls = {},
				svelte = {
					filetypes = { 'svelte' }
				},
				eslint = {
					filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'svelte', 'vue' }
				}
			}

			-- Setup all servers
			for server, config in pairs(servers) do
				lspconfig[server].setup(vim.tbl_deep_extend('force', {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config))
			end
		end
	},
	{
		"lewis6991/hover.nvim",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("hover").setup {
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					require('hover.providers.gh')
					require('hover.providers.gh_user')
					require('hover.providers.fold_preview')
					require('hover.providers.diagnostic')
				end,
				preview_opts = {
					border = 'rounded'
				},
				preview_window = false,
				title = true,
			}

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
		end
	}
}

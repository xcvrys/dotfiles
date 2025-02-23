return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp"
		},
	},
	{
		"hrsh7th/nvim-cmp",
		version = false,
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					fields = { "abbr", "kind" },
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 80,
						---@diagnostic disable-next-line: unused-local
						before = function(entry, vim_item)
							-- TODO: add tailwindcss icons
							-- vim_item = require("tailwind-tools.cmp").lspkind_format(entry, vim_item)
							local max_abbr_length = 20
							local padding = string.rep(" ", max_abbr_length - #vim_item.abbr)
							vim_item.abbr = vim_item.abbr .. padding

							return vim_item
						end,
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },            -- snippets
					{ name = "buffer" },             -- text within current buffer
					{ name = "nvim_lsp_signature_help" }, -- text within current buffer
					{ name = "path" },               -- file system paths
				}),
			})
		end,
	},
}

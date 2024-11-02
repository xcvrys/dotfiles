return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local luasnip = require("luasnip")

			local lspkind = require("lspkind")

			-- require("luasnip.loaders.from_lua").lazy_load({
			--   paths = {
			--     vim.fn.stdpath("config") .. "/lua/xcvrys/snippets",
			--   },
			-- })

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = "rounded",
						winhighlight = "Normal:CmpDocNormal",
						col_offset = -3,
						side_padding = 0,
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:CmpDocNormal",
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),

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
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "nvim_lsp_signature_help" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
				formatting = {
					fields = { "abbr", "kind" },
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 80,
						before = function(entry, vim_item)
							vim_item = require("tailwind-tools.cmp").lspkind_format(entry, vim_item)
							local max_abbr_length = 20
							local padding = string.rep(" ", max_abbr_length - #vim_item.abbr)
							vim_item.abbr = vim_item.abbr .. padding

							return vim_item
						end,
					}),
				},
			})
		end,
	},
}

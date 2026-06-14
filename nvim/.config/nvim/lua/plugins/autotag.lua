return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			-- Plugin domyślnie obsługuje większość formatów, ale w razie
			-- potrzeby możesz jawnie wymusić wsparcie dla konkretnych plików:
			-- aliases = {
			--   ["svelte"] = "html",
			-- },
		})
	end,
}

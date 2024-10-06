return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      modified_icon = "󰖷",--[[ "●" ]]
      diagnostics = "nvim_lsp",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      separator_style = "thin",
      left_trunc_marker = "󰁎 ",
      right_trunc_marker = "󰁕 ",
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  },
  config = function(_, opts)
    local bufferline = require("bufferline")

    local theme = require("kanagawa.colors").setup().theme

    local function update_bufferline_highlights()
      local current_buf = vim.api.nvim_get_current_buf()
      local seve = vim.diagnostic.severity
      local error_count = #vim.diagnostic.get(current_buf, { severity = seve.ERROR })
      local warning_count = #vim.diagnostic.get(current_buf, { severity = seve.WARN })
      local info_count = #vim.diagnostic.get(current_buf, { severity = seve.INFO })
      local hint_count = #vim.diagnostic.get(current_buf, { severity = seve.HINT })

      local tab_fg
      if error_count > 0 then
        tab_fg = theme.diag.error
      elseif warning_count > 0 then
        tab_fg = theme.diag.warning
      elseif info_count > 0 then
        tab_fg = theme.diag.info
      elseif hint_count > 0 then
        tab_fg = theme.diag.hint
      else
        tab_fg = theme.ui.pmenu.fg
      end

      vim.api.nvim_set_hl(0, "BufferLineModified", { fg = tab_fg })
      vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = tab_fg })
      vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = tab_fg })
    end

    vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter", "BufWinEnter" }, {
      callback = update_bufferline_highlights,
    })

    opts.highlights = {
      fill = {
        bg = "none",
      },
      background = {
        fg = theme.ui.whitespace,
      },
      modified = {
        fg = theme.ui.whitespace,
      },
      modified_selected = {
        fg = theme.ui.pmenu.fg,
      },
      separator = {
        fg = theme.ui.whitespace,
      },
    }

    opts.options.style_preset = {
      bufferline.style_preset.minimal,
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    }

    bufferline.setup(opts)

    vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

    for i = 1, 9 do
      vim.api.nvim_set_keymap(
        "n",
        "<space>" .. i,
        ":BufferLineGoToBuffer " .. i .. "<CR>",
        { noremap = true, silent = true }
      )
    end
  end,
}

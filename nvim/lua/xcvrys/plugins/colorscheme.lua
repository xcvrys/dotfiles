return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      transparent = true,
      undercurl = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Highlight
          YankHighlight = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },
          HighlightUndo = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },
          HighlightRedo = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },

          Pmenu = { fg = theme.ui.shade0, bg = "none", blend = vim.o.pumblend },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          MiniIndentscopeSymbol = { fg = theme.syn.comment },
          Directory = { fg = theme.ui.fg_dim },
          NvimTreeNormal = { fg = theme.ui.fg },
          Winbar = { fg = theme.syn.fun },

          -- darker
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_m1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
      end,
    })

    require("kanagawa").load("wave")
  end,
}

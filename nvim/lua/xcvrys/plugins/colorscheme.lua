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

          YankHighlight = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },
          HighlightUndo = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },
          HighlightRedo = { bg = theme.syn.identifier, fg = theme.ui.bg_m3 },
          Visual = { bg = theme.ui.bg_p1 },

          Pmenu = { fg = theme.ui.shade0, bg = "none", blend = vim.o.pumblend },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          MiniIndentscopeSymbol = { fg = theme.syn.comment },
          Directory = { fg = theme.ui.fg_dim },
          NvimTreeNormal = { fg = theme.ui.fg },
          NvimTreeFolderArrowOpen = { fg = theme.syn.comment },
          NvimTreeFolderArrowClosed = { fg = theme.syn.comment },
          Winbar = { fg = theme.syn.fun },

          TelescopeBorder = { bg = "none" },
          WilderBorder = { fg = theme.syn.comment },
        }
      end,
    })

    require("kanagawa").load("wave")
  end,
}

-- COLORS
-- diag = {
-- 	error = "#E82424",
-- 	hint = "#6A9589",
-- 	info = "#658594",
-- 	ok = "#98BB6C",
-- 	warning = "#FF9E3B"
-- },
-- diff = {
-- 	add = "#2B3328",
-- 	change = "#252535",
-- 	delete = "#43242B",
-- 	text="49443C"
-- },
-- syn = {
--     comment = "#727169",
--     constant = "#FFA066",
--     deprecated = "#717C7C",
--     fun = "#7E9CD8",
--     identifier = "#E6C384",
--     keyword = "#957FB8",
--     number = "#D27E99",
--     operator = "#C0A36E",
--     parameter = "#b8b4d0",
--     preproc = "#E46876",
--     punct = "#9CABCA",
--     regex = "#C0A36E",
--     special1 = "#7FB4CA",
--     special2 = "#E46876",
--     special3 = "#FF5D62",
--     statement = "#957FB8",
--     string = "#98BB6C",
--     type = "#7AA89F",
--     variable = "none"
--   },
--
--   ui = {
--     bg = "#1F1F28",
--     bg_dim = "#181820",
--     bg_gutter = "none",
--     bg_m1 = "#1a1a22",
--     bg_m2 = "#181820",
--     bg_m3 = "#16161D",
--     bg_p1 = "#2A2A37",
--     bg_p2 = "#363646",
--     bg_search = "#2D4F67",
--     bg_visual = "#223249",
--     fg = "#DCD7BA",
--     fg_dim = "#C8C093",
--     fg_reverse = "#223249",
--     float = {
--       bg = "#16161D",
--       bg_border = "#16161D",
--       fg = "#C8C093",
--       fg_border = "#54546D"
--     },
--     nontext = "#54546D",
--     pmenu = {
--       bg = "#223249",
--       bg_sbar = "#223249",
--       bg_sel = "#2D4F67",
--       bg_thumb = "#2D4F67",
--       fg = "#DCD7BA",
--       fg_sel = "none"
--     },
--     special = "#938AA9",
--     whitespace = "#54546D"
--   },

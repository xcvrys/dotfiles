return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  event = "VeryLazy",
  config = function()
    local kanagawa = require("lualine.themes.kanagawa")
    kanagawa.normal.c.bg = "none"
    require("lualine").setup({
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = { "alpha" },
        globalstatus = true,
        theme = kanagawa,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(res)
              if res:sub(2, 2) == "-" then
                return res:sub(1, 3)
              else
                return res:sub(1, 1)
              end
            end,
            icon = "",
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
          },
        },
        lualine_c = {
          {
            function()
              local file_name = vim.fn.expand("%:t")
              if vim.bo.filetype == "NvimTree" then
                return " "
              end
              return file_name
            end,
          },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#54546D" },
          },
          {
            "copilot",
            symbols = {
              status = {
                icons = {
                  enabled = "",
                  sleep = "",
                  disabled = "",
                  unknown = "",
                  warning = "",
                },
              },
              spinners = {
                "▁",
                "▃",
                "▄",
                "▅",
                "▆",
                "▇",
                "█",
                "▇",
                "▆",
                "▅",
                "▄",
                "▃",
              },
            },
            show_colors = false,
            show_loading = true,
          },
        },
        lualine_y = { "filetype", "location" },
        lualine_z = { { "datetime", style = "%a | %H:%M" } },
      },
    })
  end,
}

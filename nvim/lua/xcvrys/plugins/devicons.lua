return {
  "rachartier/tiny-devicons-auto-colors.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    require("tiny-devicons-auto-colors").setup({
      colors = {
        "#DCD7BA",
        "#C8C093",
        "#16161D",
        "#76946A",
        "#C34043",
        "#DCA561",
        "#FF9E3B",
        "#6A9589",
        "#658594",
        "#727169",
        "#938AA9",
        "#957FB8",
        "#7E9CD8",
        "#9CABCA",
        "#7FB4CA",
        "#A3D4D5",
        "#7AA89F",
        "#98BB6C",
        "#938056",
        "#C0A36E",
        "#E6C384",
        "#D27E99",
        "#E46876",
        "#FF5D62",
        "#FFA066",
        "#717C7C",
      },
    })
  end,
}

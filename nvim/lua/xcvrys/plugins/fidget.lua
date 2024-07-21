return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      progress = {
        display = {
          done_icon = "",
        },
      },
      notification = {
        window = {
          winblend = 0,
        },
      },
    })
  end,
}

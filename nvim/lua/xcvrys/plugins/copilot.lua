return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-l>",
        },
      },
      filetypes = {
        ["."] = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            return false
          end
          return true
        end,
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
    })
  end,
}

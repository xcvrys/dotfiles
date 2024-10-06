return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })

    keymap.set("n", "<leader>ss", function()
      vim.cmd("SessionSave")
      vim.notify("Session saved", "info", { title = "Auto Session" })
    end, { desc = "Save session" })
  end,
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    })

    -- format on sve
    vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "ConformFormatOnSave",
      pattern = "*",
      callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function()
          vim.cmd([[%s/\r//g]])
        end)
        vim.fn.setpos(".", save_cursor)

        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
    })
  end,
}

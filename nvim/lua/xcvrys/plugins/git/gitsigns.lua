return {
  "lewis6991/gitsigns.nvim",
  -- enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      local function confirm(action, action_display)
        return function()
          vim.ui.input({ prompt = "confirm " .. action_display .. " (y/n): " }, function(input)
            if input == "y" then
              action()
            end
          end)
        end
      end

      -- navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>gs", confirm(gs.stage_hunk, "Stage hunk"), "Stage hunk")
      map("n", "<leader>gr", confirm(gs.reset_hunk, "Reset hunk"), "Reset hunk")
      map(
        "v",
        "<leader>gs",
        confirm(function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk"),
        "Stage hunk"
      )
      map(
        "v",
        "<leader>gr",
        confirm(function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reste hunk"),
        "Reset hunk"
      )
      map("n", "<leader>gS", confirm(gs.stage_buffer, "Stage buffer"), "Stage buffer")
      map("n", "<leader>gR", confirm(gs.reset_buffer, "Reste buffer"), "Reset buffer")

      map("n", "<leader>gu", confirm(gs.undo_stage_hunk, "Undo stage hunk"), "Undo stage hunk")

      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>gB", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}

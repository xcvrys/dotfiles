return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  init = function()
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<F1>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true })
  end,
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sort = {
        files_first = false, -- good for Next/ SvelteKit / pages tree path related
      },
      view = {
        side = "right",
        adaptive_size = true,
        cursorline = true,
      },
      renderer = {
        root_folder_label = function(path)
          return ".../" .. vim.fn.fnamemodify(path, ":t")
        end,
        icons = {
          show = {
            file = true,
            folder = false,
            git = true,
          },
          git_placement = "after",
          glyphs = {
            --     default = "",
            --     symlink = "",
            --     bookmark = "󰆤",
            --     modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              --       default = "",
              --       open = "",
              --       empty = "",
              --       empty_open = "",
              --       symlink = "",
              --       symlink_open = "",
            },
            git = {
              unstaged = "u",
              staged = "s",
              -- unmerged = "",
              -- renamed = "➜",
              untracked = "󰲽",
              -- deleted = "",
              ignored = "◌",
              -- unstaged = "",
              -- staged = "",
              renamed = "",
              -- untracked = "",
              deleted = "",
              -- ignored = "",
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },

        icons = { error = "E ", warning = "W ", hint = "H ", info = "I " },
      },
      filters = {
        custom = { "\\.git$", "node_modules" },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      hijack_cursor = true,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = false }
        end
        vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))

        api.events.subscribe(api.events.Event.FileCreated, function(file)
          vim.cmd("edit " .. file.fname)
        end)
      end,
    })
  end,
}

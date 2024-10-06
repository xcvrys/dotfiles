HEADERS_ANIMATED = {
  "01_30x30-10.txt",
  "02_30x30-10.txt",
  "03_38x30-10.txt",
  "04_44x30-40.txt",
  "05_30x30-10.txt",
  "06_30x30-10.txt",
  "07_30x30-10.txt",
  "08_30x30-10.txt",
  "09_30x30-10.txt",
  "10_25x30-10.txt",

  "11_30x30-10.txt",
  "13_25x30-10.txt",
  "14_30x30-10.txt",
  "15_30x30-10.txt",
  "16_30x30-10.txt",
  "17_30x30-10.txt",
  "18_30x30-10.txt",
  "19_30x30-10.txt",
  "20_29x30-10.txt",

  "22_34x30-10.txt",
  "23_22x30-10.txt",
  "24_30x30-10.txt",
  "25_30x30-10.txt",
  "26_44x30-10.txt",
  "27_29x30-10.txt",
  "28_16x30-10.txt",
  "29_44x30-10.txt",
  "30_24x30-1.txt",

  "31_30x30-10.txt",
  "32_29x30-1.txt",
  "33_28x30-10.txt",
  "35_30x30-10.txt",
  "36_30x30-10.txt",
  "37_30x30-10.txt",
  "38_27x30-10.txt",
  "39_42x30-10.txt",
  "40_38x30-10.txt",

  "42_26x30-10.txt",
  "43_30x30-10.txt",
  "44_30x30-1.txt",
  "46_56x30-10.txt",
  "48_24x30-10.txt",
  "50_30x30-10.txt",
  "51_29x30-10.txt",
  "52_23x30-10.txt",
}

math.randomseed(os.time())

local custom_keymaps = {}

return {
  "goolord/alpha-nvim",
  opts = function()
    require("alpha.term")
    local footer = { opts = { position = "center" }, type = "text", val = {} }

    local idx = math.random(1, #HEADERS_ANIMATED)
    local info = HEADERS_ANIMATED[idx]
    local base_path = os.getenv("HOME") .. "/.config/nvim/lua/xcvrys/animations/"

    local function button_base(icon, val, shortcut, keymap)
      if keymap then
        custom_keymaps[shortcut] = keymap
      end
      return {
        type = "button",
        val = icon .. " " .. val,
        opts = {
          shortcut = shortcut,
          position = "center",
          width = 25,
          align_shortcut = "right",
        },
      }
    end

    local buttons = {
      button_base("", "open sesion", "s", "<cmd>SessionRestore<cr>"),
      button_base("󰁕", "open recent", "r", "<c-o>"),
      button_base("", "file explorer", "e", "<cmd>NvimTreeToggle<CR>"),
      button_base("", "find files", "f", "<cmd>Telescope find_files<CR>"),
      button_base("󰁎", "quit", "q", "<cmd> qa <cr>"),
    }

    local button_section = {
      type = "group",
      val = {},
      opts = { position = "center" },
    }

    for _, btn in ipairs(buttons) do
      table.insert(button_section.val, btn)
    end

    local img_width, img_height = string.match(info, "_(%d+)x(%d+)")

    local terminal = {
      type = "terminal",
      command = "bash " .. base_path .. "show.sh " .. base_path .. info,
      width = tonumber(img_width) * 2,
      height = tonumber(img_height) + 2,
      opts = {
        redraw = true,
      },
    }

    return {
      noautocmd = true,
      layout = {
        terminal,
        button_section,
        { type = "padding", val = 1 },
        footer,
      },
      section = {
        terminal = terminal,
        button = buttons,
        footer = footer,
      },
    }
  end,
  config = function(_, opts)
    require("alpha").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      desc = "hide cursor for alpha",
      once = true,
      callback = function()
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })
        hl.blend = 100
        vim.api.nvim_set_hl(0, "Cursor", { fg = hl.fg, bg = hl.bg, blend = hl.blend })
        vim.opt.guicursor:append("a:Cursor/lCursor")

        -- keymaps for Alpha buffer
        local bufnr = vim.api.nvim_get_current_buf()
        local keymap_opts = { noremap = true, silent = true }

        for key, cmd in pairs(custom_keymaps) do
          vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, keymap_opts)
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      desc = "show cursor after alpha",
      callback = function()
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })
        hl.blend = 0
        vim.api.nvim_set_hl(0, "Cursor", { fg = hl.fg, bg = hl.bg, blend = hl.blend })
        vim.opt.guicursor:remove("a:Cursor/lCursor")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      desc = "disable status, tabline and cmdline for alpha",
      callback = function()
        vim.go.laststatus = 0
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        opts.section.footer.val = { " ", " ", "--[[ Loaded " .. stats.count .. " plugins  in " .. ms .. "ms ]] " }
        opts.section.footer.opts.hl = "Comment"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

return {
  "RutaTang/compter.nvim",
  config = function()
    require("compter").setup({
      templates = {
        -- for number
        {
          pattern = [[-\?\d\+]],
          priority = 0,
          increase = function(content)
            content = tonumber(content)
            return content + 1, true
          end,
          decrease = function(content)
            content = tonumber(content)
            return content - 1, true
          end,
        },
        -- for lowercase alphabet
        {
          pattern = [[\l]],
          priority = 0,
          increase = function(content)
            local ansiCode = string.byte(content) + 1
            if ansiCode > string.byte("z") then
              ansiCode = string.byte("a")
            end
            local char = string.char(ansiCode)
            return char, true
          end,
          decrease = function(content)
            local ansiCode = string.byte(content) - 1
            if ansiCode < string.byte("a") then
              ansiCode = string.byte("z")
            end
            local char = string.char(ansiCode)
            return char, true
          end,
        },
        -- for uppercase alphabet
        {
          pattern = [[\u]],
          priority = 0,
          increase = function(content)
            local ansiCode = string.byte(content) + 1
            if ansiCode > string.byte("Z") then
              ansiCode = string.byte("A")
            end
            local char = string.char(ansiCode)
            return char, true
          end,
          decrease = function(content)
            local ansiCode = string.byte(content) - 1
            if ansiCode < string.byte("A") then
              ansiCode = string.byte("Z")
            end
            local char = string.char(ansiCode)
            return char, true
          end,
        },
      },
    })
  end,
}

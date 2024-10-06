return {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  opts = {
    model = "deepseek-coder-v2:latest",
    -- model = "xcvrys-dsv2",
    host = "localhost",
    port = "11434",
    quit_map = "q",
    retry_map = "<c-r>",
    init = function()
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    command = function(options)
      ---@diagnostic disable-next-line: unused-local
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    display_mode = "split",
    show_prompt = true,
    show_model = false,
    no_auto_close = true,
    debug = false,
  },
  config = function(_, opts)
    local gen = require("gen")
    gen.setup(opts)

    --- @param filetype string
    local function system(filetype)
      return "You are a coding assistant capable of providing support in "
        .. filetype
        .. ". Your primary focus is to help with writing code, debugging, optimization, and providing best practices. Your responses should be detailed, clear, and concise, including examples when relevant. Ensure that code snippets are properly formatted and explained thoroughly. Break down complex problems into smaller, manageable steps and explain each one with reasoning. Provide multiple perspectives or solutions when applicable. If a question is unclear, ask for more details to confirm your understanding before answering. Aim to help users understand concepts deeply, not just solve immediate issues."
    end

    -- TODO: Genetate_Tests

    -- reset default prompts
    gen.prompts = {}

    gen.prompts[" Chat"] = {
      prompt = "$text\n\n$input",
    }
    gen.prompts[" Explain_Concept"] = {
      prompt = system("$filetype") .. "Explain the concept of $text in detail.",
    }
    gen.prompts[" Identify_Bugs"] = {
      prompt = system("$filetype")
        .. "Identify and explain the bugs in the following $filetype code:\n```$filetype\n$text\n```",
    }
    gen.prompts[" Beautify_Code"] = {
      prompt = system("$filetype")
        .. "Beautify the following $filetype code to make it more readable only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }
    gen.prompts[" Add_Comments"] = {
      prompt = system("$filetype")
        .. "Add comments to the following $filetype code to explain its functionality, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }
    gen.prompts[" Fix_Code"] = {
      prompt = system("$filetype") .. "Fix the following $filetype code to make it work as expected:\n$text",
    }
    gen.prompts["󱈅 Analyze_Code"] = {
      prompt = system("$filetype")
        .. "Analyze the following $filetype code and provide a detailed explanation of its functionality:\n```$filetype\n$text\n```",
    }
    gen.prompts[" Explain_Code"] = {
      prompt = system("$filetype") .. "Explain the following $filetype code in detail:\n```$filetype\n$text\n```",
    }
    gen.prompts[" Review_Code"] = {
      prompt = system("$filetype")
        .. "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
    }
    gen.prompts[" Refactor_code"] = {
      prompt = system("$filetype")
        .. "Refactor the given $filetype code to improve its error handling and resilience:\n```$filetype\n$text\n```",
    }
    -- Visual
    gen.prompts[" Elaborate_Text"] = {
      prompt = "Elaborate the following text:\n$text",
      replace = false,
    }
    gen.prompts[" Make_List"] = {
      prompt = "Render the following text as a markdown list:\n$text",
    }
    gen.prompts[" Make_Table"] = {
      prompt = "Render the following text as a markdown table:\n$text",
    }
    vim.keymap.set({ "n", "v" }, "<leader>cg", ":Gen<CR>")
  end,
}

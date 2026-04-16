return {
  "mceazy2700/gemini-cli.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
  },
  opts = {
    terminal = {
      size = 100,
    },
    -- See Configuration section for options
  },
  keys = {
    { "<leader>a", nil, desc = "AI Agents" },
    { "<M-i>", "<cmd>Gemini<cr>", desc = "Toggle Gemini", mode = { "n", "i", "t" } },
    -- { "<leader>agr", "<cmd>GeminiResume<cr>", desc = "Resume Gemini" },
    -- { "<leader>agm", "<cmd>GeminiSelectModel<cr>", desc = "Select Gemini model" },
    { "<M-i>", "<cmd>GeminiAsk<cr>", desc = "Ask Gemini", mode = { "v" } },
    -- {
    --   "<leader>agb",
    --   function() require("gemini-cli.integrations").add_to_context(vim.api.nvim_buf_get_name(0)) end,
    --   desc = "Add current buffer to Gemini context",
    -- },
    -- -- Diff management (when in a (proposed) buffer)
    -- { "<leader>agy", "<cmd>GeminiDiffAccept<cr>", desc = "Accept diff" },
    -- { "<leader>agn", "<cmd>GeminiDiffDeny<cr>", desc = "Deny diff" },
  },
}

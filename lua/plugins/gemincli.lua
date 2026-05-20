return {
  "mceazy2700/antigravity-cli.nvim",
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
    { "<M-i>", "<cmd>Antigravity<cr>", desc = "Toggle Antigravity", mode = { "n", "i", "t" } },
    { "<M-i>", "<cmd>AntigravityAsk<cr>", desc = "Ask Antigravity", mode = { "v" } },
  },
}

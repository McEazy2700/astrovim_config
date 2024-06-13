return {
  -- this plugin will be loaded when using `:ZenMode`
  { "folke/zen-mode.nvim", cmd = "ZenMode" },
  -- this plugin will be loaded when opening a "markdown" file
  { "lukas-reineke/headlines.nvim", ft = "markdown" },
  {
    "lewis6991/gitsigns.nvim",
    event = "User AstroGitFile",
  },
  {
    "echasnovski/mini.move",
    keys = {
      { "<M-h>", mode = { "v", "n" } },
      { "<M-j>", mode = { "v", "n" } },
      { "<M-k>", mode = { "v", "n" } },
      { "<M-l>", mode = { "v", "n" } },
    },
  },
}

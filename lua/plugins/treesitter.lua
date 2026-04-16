---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  opts = {
    auto_install = true,
    highlight = { enable = true },
    ensure_installed = {
      -- Base
      "lua",
      "vim",
      "vimdoc",
      "regex",

      -- Rust
      "rust",
      "toml",

      -- TypeScript / JavaScript / React
      "typescript",
      "javascript",
      "html",
      "css",
      "json",
      "jsonc",

      -- Svelte
      "svelte",
      "graphql",

      -- Python
      "python",

      -- Go
      "go",
      "gomod",
      "gosum",
      "gowork",

      -- Docker
      "dockerfile",
      "yaml",

      -- Bash
      "bash",

      -- General
      "markdown",
      "markdown_inline",
      "comment",
      "gitignore",
      "git_config",
      "git_rebase",
      "diff",
      "sql",
    },
  },
}

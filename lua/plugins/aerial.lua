return {
  "stevearc/aerial.nvim",
  opts = function(_, opts)
    opts.backends = { "lsp", "markdown", "man" }
  end,
}

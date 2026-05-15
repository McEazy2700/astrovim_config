-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    -- Extend rather than replace so community pack sources are preserved.
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
    config.sources = config.sources or {}
    vim.list_extend(config.sources, {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.phpcsfixer,
    })
    return config
  end,
}

-- Ensure gd/gr/rename/code_action keymaps work consistently in Rust.
-- rustaceanvim's on_attach can set its own buffer-local mappings; we wrap it
-- so ours are applied last and always win.
return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    local original_on_attach = (opts.server or {}).on_attach
    opts.server = opts.server or {}
    opts.server.on_attach = function(client, bufnr)
      if original_on_attach then original_on_attach(client, bufnr) end
      -- Telescope-based navigation (mirrors astrolsp.lua)
      vim.keymap.set(
        "n",
        "gd",
        "<cmd>Telescope lsp_definitions<cr>",
        { buffer = bufnr, desc = "Definition of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gr",
        "<cmd>Telescope lsp_references<cr>",
        { buffer = bufnr, desc = "References of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gi",
        "<cmd>Telescope lsp_implementations<cr>",
        { buffer = bufnr, desc = "Implementation of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gt",
        "<cmd>Telescope lsp_type_definitions<cr>",
        { buffer = bufnr, desc = "Type definition of current symbol", silent = true }
      )
      -- Standard LSP actions
      vim.keymap.set(
        "n",
        "<leader>lr",
        vim.lsp.buf.rename,
        { buffer = bufnr, desc = "Rename current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>la",
        vim.lsp.buf.code_action,
        { buffer = bufnr, desc = "LSP code action", silent = true }
      )
    end
    return opts
  end,
}

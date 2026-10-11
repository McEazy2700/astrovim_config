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
      -- Snacks picker-based navigation (mirrors astrolsp.lua)
      vim.keymap.set(
        "n",
        "gd",
        function() Snacks.picker.lsp_definitions() end,
        { buffer = bufnr, desc = "Definition of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gr",
        function() Snacks.picker.lsp_references() end,
        { buffer = bufnr, desc = "References of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gi",
        function() Snacks.picker.lsp_implementations() end,
        { buffer = bufnr, desc = "Implementation of current symbol", silent = true }
      )
      vim.keymap.set(
        "n",
        "gt",
        function() Snacks.picker.lsp_type_definitions() end,
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

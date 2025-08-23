return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        enabled = false,
      },
      tsserver = {
        enabled = true,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "literals",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
    setup = {
      tsserver = function() return false end,
      vtsls = function() return true end,
    },
  },
}

return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") == 1
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  opts = {
    provider = "openrouter",
    auto_suggestions_provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai",
        api_key_name = "OPENROUTER_API_KEY",
        model = "openrouter/owl-alpha",
      },
    },
  },
}

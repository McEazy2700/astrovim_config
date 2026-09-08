return {
  "yetone/avante.nvim",
  opts = {
    provider = "openrouter",
    auto_suggestions_provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "openrouter/owl-alpha",
      },
    },
  },
}

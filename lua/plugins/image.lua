---@type LazySpec
return {
  {
    "3rd/image.nvim",
    build = "luarocks --local install magick",
    event = "BufEnter",
    opts = {
      backend = "kitty",
      kitty_method = "normal",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = 90,
      max_height_window_percentage = 80,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
    config = function(_, opts)
      require("image").setup(opts)

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.bmp", "*.ico" },
        callback = function()
          local image = require "image"
          image.clear()
          local img = image.from_file(vim.fn.expand "%:p", {
            window = vim.api.nvim_get_current_win(),
            buffer = vim.api.nvim_get_current_buf(),
            with_virtual_padding = true,
          })
          if img then img:render() end
        end,
      })
    end,
  },
}

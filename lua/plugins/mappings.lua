local Terminal = require("toggleterm.terminal").Terminal
local btop = Terminal:new { cmd = "btop", hidden = true, id = 10, direction = "float" }

function _Btop_toggle() btop:toggle() end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<M-f>"] = { "<cmd>2 ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
          ["<M-h>"] = { "<cmd>3 ToggleTerm size=30 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
          ["<M-v>"] = { "<cmd>4 ToggleTerm size=100 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
          ["<M-b>"] = { "<cmd>lua _Btop_toggle()<cr>", desc = "Btop" },
          ["<leader>x"] = { "<cmd>bd<cr>", desc = "Close buffer" },
        },
        t = {
          ["<M-f>"] = { "<cmd>2 ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
          ["<M-h>"] = { "<cmd>3 ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
          ["<M-b>"] = { "<cmd>lua _Btop_toggle()<cr>", desc = "Btop" },
          ["<M-v>"] = { "<cmd>4 ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
        },
      },
    },
  },
}

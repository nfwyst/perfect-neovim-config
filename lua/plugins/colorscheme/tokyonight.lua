return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    local tokyonight = require("tokyonight")
    tokyonight.setup({
      light_style = "day",
      transparent = true,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
      },
      lualine_bold = true,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}

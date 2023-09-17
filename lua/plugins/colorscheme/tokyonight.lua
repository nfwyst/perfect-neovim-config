local name = "tokyonight"

return {
  "folke/tokyonight.nvim",
  name = name,
  lazy = false,
  priority = 1000,
  config = function()
    local tokyonight = require(name)
    tokyonight.setup({
      light_style = "day",
      transparent = true,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = true },
        keywords = { italic = false },
      },
      lualine_bold = true,
    })
    SET_COLORSCHEME(name)
  end,
}

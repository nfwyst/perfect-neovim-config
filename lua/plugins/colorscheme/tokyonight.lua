local name = "tokyonight"
local fg = "#CBE0F0"
local fg_dark = "#B4D0E9"
local border = "#547998"

return {
  "folke/tokyonight.nvim",
  name = name,
  lazy = false,
  priority = 1000,
  config = function()
    require(name).setup({
      light_style = "day",
      transparent = true,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = true },
        keywords = { italic = false },
      },
      lualine_bold = true,
      on_colors = function(colors)
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_sidebar = fg_dark
      end,
    })
    SET_COLORSCHEME(name)
  end,
}

local name = "NeoSolarized"

return {
  "Tsuzat/NeoSolarized.nvim",
  name = name,
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require(name)
    solarized.setup({
      style = SCHEME_BACKGROUND,
      transparent = true,
      terminal_colors = true,
      enable_italics = true,
      styles = {
        keywords = { italic = false },
        functions = { bold = true },
        string = { italic = false },
        underline = true,
        undercurl = false,
      },
    })
    SET_COLORSCHEME(name)
  end,
}

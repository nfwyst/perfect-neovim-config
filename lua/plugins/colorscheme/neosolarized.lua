return {
  "Tsuzat/NeoSolarized.nvim",
  name = "NeoSolarized",
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require("NeoSolarized")
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
  end,
}

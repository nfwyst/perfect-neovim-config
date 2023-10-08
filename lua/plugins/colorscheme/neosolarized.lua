local name = "NeoSolarized"

local function init_hi()
  local colors = require("NeoSolarized.colors")
  local color = colors[SCHEME_BACKGROUND]
  SET_TIMEOUT(function()
    SET_HIGHLIGHT(MERGE_ARRAYS(CURSOR_HILIGHT_OPTS, {
      "LineNr guifg=" .. color.fg1,
      "CursorLineNr guifg=" .. color.base1,
      "@variable guifg=" .. color.fg0,
      "Normal guifg=" .. color.fg0,
      "Comment guifg=" .. color.fg2,
    }))
  end)
end

return {
  "Tsuzat/NeoSolarized.nvim",
  name = name,
  lazy = false,
  priority = 1000,
  config = function()
    require(name).setup({
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
    init_hi()
  end,
}

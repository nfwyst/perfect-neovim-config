local name = "NeoSolarized"
local illuminate = { bg = "#B2D4FC", fg = "#4d2b03", bold = true }

local function init_hi()
  local colors = require("NeoSolarized.colors")
  local color = colors[SCHEME_BACKGROUND]
  SET_TIMEOUT(function()
    SET_HIGHLIGHT(MERGE_ARRAYS(CURSOR_HILIGHT_OPTS, {
      "LineNr guifg=" .. color.fg1,
      "CursorLineNr guifg=" .. "#388bfd",
      "@variable guifg=" .. color.fg0,
      "Normal guifg=" .. color.fg0,
      "Comment guifg=" .. color.fg2,
    }))
    SET_HL({
      IlluminatedWord = illuminate,
      IlluminatedCurWord = illuminate,
      IlluminatedWordText = illuminate,
      IlluminatedWordRead = illuminate,
      IlluminatedWordWrite = illuminate,
    })
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

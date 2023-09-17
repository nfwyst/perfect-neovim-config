local function init()
  AUTOCMD("FileType", {
    pattern = "Outline",
    command = "silent!set nospell",
    group = AUTOGROUP("_outlines", { clear = true }),
  })
end

local black_list = {
  "File",
  "Namespace",
  "Package",
  "Enum",
  "Variable",
  "Constant",
  "String",
  "Number",
  "Boolean",
  "Array",
  "Object",
  "Key",
  "Null",
  "EnumMember",
  "Event",
  "Operator",
  "TypeParameter",
  "Component",
  "Fragment",
}

return {
  "simrat39/symbols-outline.nvim",
  cmd = { "SymbolsOutline" },
  config = function()
    require("symbols-outline").setup({
      position = "left",
      width = 20,
      highlight_hovered_item = false,
      show_guides = false,
      symbol_blacklist = black_list,
    })
    init()
  end,
}

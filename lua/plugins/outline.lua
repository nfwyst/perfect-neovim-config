local function init()
  AUTOCMD("FileType", {
    pattern = "Outline",
    command = "silent!set nospell",
    group = AUTOGROUP("_outlines", { clear = true }),
  })
end

local black_list = {
  "Namespace",
  "Enum",
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
  "Fragment",
}

return {
  "simrat39/symbols-outline.nvim",
  cond = not IS_VSCODE,
  cmd = "SymbolsOutline",
  config = function()
    require("symbols-outline").setup({
      position = "left",
      show_guides = false,
      symbol_blacklist = black_list,
    })
    init()
  end,
}

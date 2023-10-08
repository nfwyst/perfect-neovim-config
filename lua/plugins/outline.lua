local function init()
  AUTOCMD("FileType", {
    pattern = "Outline",
    command = "silent!set nospell",
    group = AUTOGROUP("_outlines_", { clear = true }),
  })
end

return {
  "simrat39/symbols-outline.nvim",
  cond = not IS_VSCODE,
  cmd = "SymbolsOutline",
  config = function()
    require("symbols-outline").setup({
      position = "left",
      show_guides = false,
      symbol_blacklist = {
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
      },
    })
    init()
  end,
}

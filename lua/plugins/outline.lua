return {
  "simrat39/symbols-outline.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
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
  end,
}

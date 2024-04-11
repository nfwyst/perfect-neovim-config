return {
  "hedyhli/outline.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = { "Outline", "OutlineOpen" },
  opts = {
    symbol_folding = {
      autofold_depth = false,
    },
    outline_window = {
      position = "left",
      hide_cursor = true,
    },
  },
}

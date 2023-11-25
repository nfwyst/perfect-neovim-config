return {
  "karb94/neoscroll.nvim",
  cond = not IS_VSCODE,
  keys = {
    "<c-u>",
    "<c-d>",
    "<c-b>",
    "<c-f>",
    "<c-y>",
    "<c-e>",
    "zt",
    "zz",
    "zb",
  },
  opts = {
    performance_mode = not IS_MAC,
  },
}

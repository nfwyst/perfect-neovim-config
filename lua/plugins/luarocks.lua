return {
  "vhyrro/luarocks.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE and not IS_LINUX,
  priority = 1000,
  config = true,
}

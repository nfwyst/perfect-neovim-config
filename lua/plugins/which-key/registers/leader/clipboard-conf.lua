return {
  name = "Clipboard",
  r = { "<cmd>let @+ = expand('%')<cr>", "Copy file relative path" },
  a = { "<cmd>let @+ = expand('%:p')<cr>", "Copy file absolute path" },
}

return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  cond = not IS_VSCODE,
  ft = TSX_COMMENT_INCLUDED_FILES,
  config = true,
}

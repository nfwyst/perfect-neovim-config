return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  cond = not IS_VSCODE_OR_LEET_CODE,
  ft = TSX_COMMENT_INCLUDED_FILES,
  opts = {
    enable_autocmd = false,
  },
}

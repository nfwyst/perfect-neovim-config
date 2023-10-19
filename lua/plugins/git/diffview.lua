return {
  "sindrets/diffview.nvim",
  cond = not IS_VSCODE,
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  config = true,
}

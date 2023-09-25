return {
  "folke/todo-comments.nvim",
  cond = not IS_VSCODE,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = not IS_WINDOWS,
  },
}

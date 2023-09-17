return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = { "[t", "]t" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = not IS_WINDOWS,
  },
}

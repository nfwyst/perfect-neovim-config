return {
  "lewis6991/gitsigns.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    max_file_length = MAX_FILE_LENGTH,
    update_debounce = 200,
    preview_config = {
      border = "rounded",
    },
  },
}

return {
  "lewis6991/gitsigns.nvim",
  cond = not IS_VSCODE,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    watch_gitdir = {
      interval = 1000,
    },
    current_line_blame_formatter_opts = {
      relative_time = false,
    },
    max_file_length = MAX_FILE_LENGTH,
    update_debounce = 200,
    preview_config = {
      border = "rounded",
    },
  },
}

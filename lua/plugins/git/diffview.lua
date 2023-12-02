return {
  "sindrets/diffview.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  config = function()
    require("diffview").setup({
      hooks = {
        diff_buf_read = function()
          SET_OPTS({
            number = false,
            relativenumber = false,
            statuscolumn = "",
            foldcolumn = "0",
          }, true)
        end,
      },
    })
  end,
}

return {
  "stevearc/dressing.nvim",
  cond = not IS_VSCODE,
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        title_pos = "center",
        relative = "editor",
        default_prompt = "➤ ",
        win_options = {
          winblend = 0,
          cursorline = false,
        },
      },
    })
  end,
}

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        title_pos = "center",
        relative = "editor",
        default_prompt = "➤ ",
        prefer_width = 0.5,
        max_width = { 1200, 0.9 },
        min_width = { 50, 0.5 },
        win_options = {
          winblend = 0,
          cursorline = false,
        },
      },
    })
  end,
}

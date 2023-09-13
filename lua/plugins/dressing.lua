return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    local dressing = require("dressing")
    dressing.setup({
      input = {
        title_pos = "center",
        relative = "editor",
      },
    })
  end,
}

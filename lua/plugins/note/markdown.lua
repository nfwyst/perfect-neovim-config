return {
  "ellisonleao/glow.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = "Glow",
  ft = "markdown",
  config = function()
    local glow = require("glow")
    glow.setup({
      border = "rounded",
      width_ratio = 0.93,
      height_ratio = 0.9,
      width = 200,
      height = 200,
    })
  end,
}

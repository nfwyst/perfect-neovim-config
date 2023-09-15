return {
  "ellisonleao/glow.nvim",
  cmd = "Glow",
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

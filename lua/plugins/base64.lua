return {
  "taybart/b64.nvim",
  cond = not vim.base64,
  event = "VeryLazy",
  config = function()
    local b64 = require("b64")
    vim.base64 = {
      encode = b64.enc,
      decode = b64.dec,
    }
  end,
}

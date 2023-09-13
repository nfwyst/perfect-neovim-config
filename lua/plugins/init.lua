return {
  "famiu/bufdelete.nvim",
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
}

return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    if MANUAL_MODE then
      vim.notify("manual mode, project root will not detect automatically")
    end
  end,
}

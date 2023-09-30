local function init()
  if MANUAL_MODE then
    vim.notify("manual mode, project root will not detect automatically")
  end
  USER_COMMAND("DissmissNotification", function()
    require("notify").dismiss({ silent = true, pending = true })
  end)
end

return {
  "rcarriga/nvim-notify",
  cond = not IS_VSCODE,
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.825)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.248)
      end,
      render = "wrapped-compact",
    })
    vim.notify = notify
    init()
  end,
}

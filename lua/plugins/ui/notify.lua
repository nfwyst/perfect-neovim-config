local function init(notify)
  if MANUAL_MODE then
    LOG_INFO(
      "project.nvim is in manual mode",
      "manual mode, project root will not detect automatically"
    )
  end
  SET_USER_COMMANDS({
    DissmissNotification = function()
      notify.dismiss({ silent = true, pending = true })
    end,
    ShowWorkspacePath = function()
      LOG_INFO("workspace path is", WORKSPACE_PATH)
    end,
  })
end

return {
  "rcarriga/nvim-notify",
  cond = not IS_VSCODE,
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.25)
      end,
      render = "wrapped-compact",
    })
    init(notify)
  end,
}

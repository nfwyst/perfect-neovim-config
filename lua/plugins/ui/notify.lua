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
      animate = not IS_WIN_LINUX,
      stages = IS_WIN_LINUX and "static" or "fade_in_slide_out",
      max_height = function()
        return math.floor(vim.o.lines * 0.9)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.5)
      end,
      render = "wrapped-compact",
    })
    init(notify)
  end,
}

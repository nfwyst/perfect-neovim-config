return {
  "dbinagi/nomodoro",
  cond = not IS_VSCODE,
  cmd = { "NomoTimer", "NomoMenu" },
  config = function()
    require("nomodoro").setup({
      work_time = 25,
      break_time = 5,
      menu_available = true,
      texts = {
        on_break_complete = "TIME IS UP!",
        on_work_complete = "TIME IS UP!",
        status_icon = "🍅",
        timer_format = "!%0M:%0S", -- To include hours: '!%0H:%0M:%0S'
      },
      on_work_complete = function()
        LOG_INFO("TIME IS UP!", "It's time to reset")
      end,
      on_break_complete = function()
        LOG_INFO("TIME IS UP!", "It's time to continue")
      end,
    })
  end,
}

return {
  name = "pomodoro timer",
  m = { "<cmd>NomoMenu<cr>", "timer menu" },
  c = {
    function()
      vim.ui.input({ prompt = "Enter minutes: " }, function(minutes)
        if not minutes then
          LOG_ERROR("no time", "run failed")
        else
          vim.cmd("NomoTimer" .. minutes)
        end
      end)
    end,
    "custom time",
  },
}

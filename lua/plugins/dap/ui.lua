return {
  "rcarriga/nvim-dap-ui",
  cond = DAP_DEBUG_ENABLED and not IS_VSCODE_OR_LEET_CODE,
  dependencies = { "mfussenegger/nvim-dap" },
  lazy = true,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local before_listener = dap.listeners.before
    local after_listener = dap.listeners.after
    dapui.setup()
    local function close_ui()
      dapui.close()
    end
    after_listener.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    before_listener.event_terminated["dapui_config"] = close_ui
    before_listener.event_exited["dapui_config"] = close_ui
  end,
}

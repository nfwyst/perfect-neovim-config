local pwa_node = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

DEFINE_SIGNS({
  DapBreakpoint = "🟥",
  DapStopped = "🟦",
})

SET_USER_COMMANDS({
  DebugNode = function()
    local dap = require("dap")
    local dap_utils = require("dap.utils")
    dap.run({
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
      sourceMaps = true,
      processId = dap_utils.pick_process,
      skipFiles = { "<node_internals>/**/*.js" },
    })
  end,
  DebugJest = function()
    local dap = require("dap")
    dap.run({
      type = "pwa-node",
      request = "launch",
      name = "Launch Jest",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**/*.js" },
    })
  end,
  SetBreakPointCondition = function()
    local dap = require("dap")
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end,
  DapRuntoCursor = function()
    local dap = require("dap")
    dap.run_to_cursor()
  end,
  ClearBreakpoints = function()
    local dap = require("dap")
    dap.clear_breakpoints()
  end,
  SetExceptionBreakpoints = function()
    local dap = require("dap")
    dap.set_exception_breakpoints({ "all" })
  end,
  DapUiHover = function()
    local widgets = require("dap.ui.widgets")
    widgets.hover()
  end,
  DapUiScopes = function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end,
  DapUp = function()
    local dap = require("dap")
    dap.Up()
  end,
  DapDown = function()
    local dap = require("dap")
    dap.Down()
  end,
  DapOpenRepl = function()
    local dap = require("dap")
    dap.repl.open({}, "vsplit")
  end,
  DapUiOpen = function()
    local dapui = require("dapui")
    dapui.open()
  end,
  DapUiClose = function()
    local dapui = require("dapui")
    dapui.close()
  end,
})

return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    dap.adapters["pwa-node"] = pwa_node
  end,
}

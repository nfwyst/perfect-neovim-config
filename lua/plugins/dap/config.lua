local pwa_node = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

local function init(dap, dap_utils)
  DEFINE_SIGNS({
    DapBreakpoint = "🟥",
    DapStopped = "🟦",
  })
  SET_USER_COMMANDS({
    DebugNode = function()
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
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    DapRuntoCursor = function()
      dap.run_to_cursor()
    end,
    ClearBreakpoints = function()
      dap.clear_breakpoints()
    end,
    SetExceptionBreakpoints = function()
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
      dap.Up()
    end,
    DapDown = function()
      dap.Down()
    end,
    DapOpenRepl = function()
      dap.repl.open({}, "vsplit")
    end,
    DapCloseRepl = function()
      dap.repl.close()
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
end

return {
  "mfussenegger/nvim-dap",
  cond = DAP_DEBUG_ENABLED and not IS_VSCODE_OR_LEET_CODE,
  cmd = {
    "DapSetLogLevel",
    "DapShowLog",
    "DapContinue",
    "DapToggleBreakpoint",
    "DapToggleRepl",
    "DapStepOver",
    "DapStepInto",
    "DapStepOut",
    "DapTerminate",
    "SetBreakPointCondition",
    "DapRuntoCursor",
    "ClearBreakpoints",
    "SetExceptionBreakpoints",
    "DebugNode",
    "DebugJest",
    "DapUiHover",
    "DapUiScopes",
    "DapUiOpen",
    "DapUiClose",
    "DapUp",
    "DapDown",
    "DapOpenRepl",
    "DapCloseRepl",
  },
  config = function()
    local dap = require("dap")
    local dap_utils = require("dap.utils")
    dap.adapters["pwa-node"] = pwa_node
    init(dap, dap_utils)
  end,
}

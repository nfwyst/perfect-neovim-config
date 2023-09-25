return {
  "theHamsta/nvim-dap-virtual-text",
  enabled = DAP_DEBUG_ENABLED,
  cond = not IS_VSCODE,
  dependencies = "mfussenegger/nvim-dap",
  lazy = true,
  config = true,
}

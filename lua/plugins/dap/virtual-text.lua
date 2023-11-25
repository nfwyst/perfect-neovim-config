return {
  "theHamsta/nvim-dap-virtual-text",
  cond = DAP_DEBUG_ENABLED and not IS_VSCODE,
  dependencies = { "mfussenegger/nvim-dap" },
  lazy = true,
  config = true,
}

return {
  "nvim-telescope/telescope-dap.nvim",
  enabled = DAP_DEBUG_ENABLED,
  cond = not IS_VSCODE,
  cmd = { "Telescope dap" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("telescope").load_extension("dap")
  end,
}

return {
  "nvim-telescope/telescope-dap.nvim",
  cond = DAP_DEBUG_ENABLED and not IS_VSCODE_OR_LEET_CODE,
  cmd = { "Telescope dap" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("telescope").load_extension("dap")
  end,
}

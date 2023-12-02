return {
  "nvim-telescope/telescope-project.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = { "Telescope projects" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "ahmedkhalf/project.nvim",
  },
  config = function()
    require("telescope").load_extension("projects")
  end,
}

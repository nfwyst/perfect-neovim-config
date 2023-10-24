return {
  "nvim-telescope/telescope-project.nvim",
  cond = not IS_VSCODE,
  cmd = { "Telescope projects" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "ahmedkhalf/project.nvim",
  },
  config = function()
    require("telescope").load_extension("projects")
  end,
}

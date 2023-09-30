return {
  "Dhanus3133/LeetBuddy.nvim",
  cond = not IS_VSCODE,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "LBQuestions",
    "LBQuestion",
    "LBReset",
    "LBTest",
    "LBSubmit",
  },
  config = function()
    require("leetbuddy").setup({
      domain = "cn",
      language = "ts",
    })
  end,
}

return {
  "kawre/leetcode.nvim",
  cond = not IS_VSCODE and IS_LEET_CODE,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("leetcode").setup({
      lang = "typescript",
      logging = false,
      cn = {
        enabled = true,
      }
    })
  end,
}

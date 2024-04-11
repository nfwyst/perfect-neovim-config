return {
  "nvim-neotest/neotest",
  cond = not IS_VSCODE_OR_LEET_CODE,
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}

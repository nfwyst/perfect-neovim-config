local function init(lint)
  AUTOCMD({ "BufWritePost" }, {
    callback = function()
      pcall(function()
        lint.try_lint()
      end)
    end,
  })
end

return {
  "mfussenegger/nvim-lint",
  cond = not IS_VSCODE,
  event = "VeryLazy",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascriptreact = { "eslint" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
    }
    init(lint)
  end,
}

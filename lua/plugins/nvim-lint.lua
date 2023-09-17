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
  event = "VeryLazy",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascriptreact = { "eslint" },
    }
    init(lint)
  end,
}

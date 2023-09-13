AUTOCMD({ "BufWritePost" }, {
  callback = function()
    pcall(function()
      require("lint").try_lint()
    end)
  end,
})

return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascriptreact = { "eslint" },
    }
  end,
}

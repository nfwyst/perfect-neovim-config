AUTOCMD("BufWritePost", {
  command = "Lint",
  group = AUTOGROUP("lint", { clear = true }),
})

local function init(lint)
  USER_COMMAND("Lint", function()
    PCALL(function()
      lint.try_lint()
    end)
  end)
end

return {
  "mfussenegger/nvim-lint",
  cond = not IS_VSCODE,
  cmd = "Lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
    }
    init(lint)
  end,
}

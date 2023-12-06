local cond = not IS_VSCODE_OR_LEET_CODE
if cond then
  AUTOCMD("BufWritePost", {
    command = "Lint",
    group = AUTOGROUP("_lint_", { clear = true }),
  })
end

local function init(lint)
  USER_COMMAND("Lint", function()
    PCALL(function()
      lint.try_lint()
    end)
  end)
end

return {
  "mfussenegger/nvim-lint",
  cond = cond,
  cmd = "Lint",
  config = function()
    local fe = { "eslint_d" }
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = fe,
      typescript = fe,
      typescriptreact = fe,
      javascriptreact = fe,
      svelte = fe,
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
    }
    init(lint)
  end,
}

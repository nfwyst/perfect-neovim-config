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

local fe = { "eslint_d" }

return {
  "mfussenegger/nvim-lint",
  cond = not IS_VSCODE,
  cmd = "Lint",
  config = function()
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

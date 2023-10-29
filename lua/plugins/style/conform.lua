local fe = { "eslint_d", "prettierd" }
local c = { "clang_format" }

local function setup_eslint()
  local eslint_d = require("conform.formatters.eslint_d")
  eslint_d.cwd = require("conform.util").root_file({
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.json",
  })
  eslint_d.require_cwd = true
end

local function init(conform)
  vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
  setup_eslint()
  USER_COMMAND("Format", function()
    conform.format({
      lsp_fallback = true,
      async = true,
      timeout_ms = 800,
    })
  end)
end

return {
  "stevearc/conform.nvim",
  cond = not IS_VSCODE,
  cmd = { "Format", "ConformInfo" },
  config = function()
    local conform = require("conform")
    init(conform)
    conform.setup({
      log_level = vim.log.levels.OFF,
      formatters_by_ft = {
        javascript = fe,
        typescript = fe,
        javascriptreact = fe,
        typescriptreact = fe,
        svelte = fe,
        css = fe,
        scss = fe,
        html = fe,
        json = fe,
        jsonc = fe,
        markdown = fe,
        yaml = fe,
        graphql = fe,
        c = c,
        cpp = c,
        sh = { "shfmt" },
        zsh = { "beautysh" },
        lua = { "stylua" },
        ["_"] = { "trim_whitespace" },
      },
      formatters = {
        beautysh = function()
          return {
            command = "beautysh",
            args = {
              "-i",
              vim.opt.shiftwidth:get(),
              "$FILENAME",
            },
            stdin = false,
          }
        end,
      },
    })
  end,
}

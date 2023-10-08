local fe = { "prettierd" }
local c = { "clang_format" }
local opt = {
  lsp_fallback = true,
  async = false,
  timeout_ms = 800,
}

local function init(conform)
  USER_COMMAND("Format", function()
    conform.format(opt)
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
      formatters_by_ft = {
        javascript = fe,
        typescript = fe,
        javascriptreact = fe,
        typescriptreact = fe,
        svelte = fe,
        css = fe,
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

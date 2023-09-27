local function require_formatter(lang, runner)
  return {
    require("formatter.filetypes." .. lang)[runner],
  }
end

local function require_prettier(lang)
  return require_formatter(lang, "prettier")
end

return {
  "mhartington/formatter.nvim",
  cond = not IS_VSCODE,
  cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
  config = function()
    require("formatter").setup({
      filetype = {
        javascript = require_prettier("javascript"),
        javascriptreact = require_prettier("javascriptreact"),
        typescript = require_prettier("typescript"),
        typescriptreact = require_prettier("typescriptreact"),
        lua = require_formatter("lua", "stylua"),
        c = require_formatter("c", "clangformat"),
        cpp = require_formatter("cpp", "clangformat"),
        json = require_prettier("json"),
        jsonc = require_prettier("json"),
        markdown = require_prettier("markdown"),
        yaml = require_prettier("yaml"),
        sh = require_formatter("sh", "shfmt"),
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}

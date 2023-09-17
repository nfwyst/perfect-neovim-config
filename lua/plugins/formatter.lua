local function init()
  AUTOCMD({ "BufWritePost" }, {
    command = "silent!FormatWriteLock",
  })
end

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
  cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
  config = function()
    local formatter = require("formatter")
    formatter.setup({
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
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
    init()
  end,
}

AUTOCMD({ "BufWritePost" }, {
  command = "silent!FormatWriteLock",
})

return {
  "mhartington/formatter.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local formatter = require("formatter")
    formatter.setup({
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        c = {
          require("formatter.filetypes.c").clangformat,
        },
        cpp = {
          require("formatter.filetypes.cpp").clangformat,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}

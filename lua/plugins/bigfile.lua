local my_feature = {
  name = "my_feature",
  opts = {
    defer = true,
  },
  disable = function()
    RUN_CMD("ColorizerDetachFromBuffer", true)
    RUN_CMD("TabnineDisable", true)
    RUN_CMD("UfoDetach", true)
  end,
}

return {
  "lunarvim/bigfile.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  event = { "FileReadPre", "BufReadPre", "User FileOpened" },
  config = function()
    require("bigfile").config({
      pattern = function(bufnr, filesize_mib)
        local file_contents = vim.fn.readfile(GET_BUFFER_NAME(bufnr))
        local file_length = #file_contents
        local filetype = vim.filetype.match({ buf = bufnr })
        if TABLE_CONTAINS({ "help", "text", "markdown" }, filetype) then
          return false
        end
        return file_length > MAX_FILE_LENGTH or filesize_mib > MAX_FILE_SIZE
      end,
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "vimopts",
        "filetype",
        my_feature,
      },
    })
  end,
}

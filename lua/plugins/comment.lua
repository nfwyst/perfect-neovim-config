local mode = { "x", "n", "o" }

return {
  "numToStr/Comment.nvim",
  cond = not IS_VSCODE,
  keys = {
    { "gb", mode = mode },
    { "gc", mode = mode },
    { "g>", mode = mode },
    { "g<lt>", mode = mode },
    "gbc",
    "gcc",
    "gco",
    "gcO",
    "gcA",
    "g>c",
    "g>b",
    "g<lt>c",
    "g<lt>b",
  },
  opts = {
    pre_hook = function(...)
      if not TABLE_CONTAINS(TSX_COMMENT_INCLUDED_FILES, vim.bo.filetype) then
        return
      end
      local mod = "ts_context_commentstring.integrations.comment_nvim"
      local prehook = require(mod).create_pre_hook()
      return prehook(...)
    end,
  },
}

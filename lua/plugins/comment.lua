return {
  "numToStr/Comment.nvim",
  cond = not IS_VSCODE,
  keys = {
    { "gb", mode = WHICHKEY_MODE },
    { "gc", mode = WHICHKEY_MODE },
    { "g>", mode = WHICHKEY_MODE },
    { "g<lt>", mode = WHICHKEY_MODE },
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
      local need_tsx =
        TABLE_CONTAINS(TSX_COMMENT_INCLUDED_FILES, vim.bo.filetype)
      if not need_tsx or IS_VSCODE_OR_LEET_CODE then
        return
      end
      local mod = "ts_context_commentstring.integrations.comment_nvim"
      local prehook = require(mod).create_pre_hook()
      return prehook(...)
    end,
  },
}

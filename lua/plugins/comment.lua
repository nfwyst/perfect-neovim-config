return {
  "numToStr/Comment.nvim",
  cond = not IS_VSCODE,
  keys = {
    { "gb", mode = { "x", "o" } },
    { "gc", mode = { "x", "o" } },
    { "g>", mode = "x" },
    { "g<lt>", mode = "x" },
    "gbc",
    "gcc",
    "gco",
    "gcO",
    "gcA",
    "g>c",
    "g>b",
    "g<lt>c",
    "g<lt>b",
    "]t",
    "[t",
  },
  opts = {
    pre_hook = function(ctx)
      if not TABLE_CONTAINS(TSX_COMMENT_INCLUDED_FILES, vim.bo.filetype) then
        return
      end
      local prehook = require(
        "ts_context_commentstring.integrations.comment_nvim"
      ).create_pre_hook()
      prehook(ctx)
    end,
  },
}

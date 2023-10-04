SET_USER_COMMANDS({
  OpenCurFile = function()
    vim.fn.system({ "open", vim.fn.expand("%") })
  end,
  ExitInsertMode = function()
    vim.cmd.stopinsert()
    local ok, snip = pcall(require, "luasnip")
    if not ok then
      LOG_WARN("plugin missing", "luasnip is not installed...")
    else
      pcall(snip.unlink_current)
    end
  end,
})

SET_USER_COMMANDS({
  OpenCurFile = function()
    vim.fn.system({ "open", vim.fn.expand("%") })
  end,
  ExitInsertMode = function()
    local ok, snip = pcall(require, "luasnip")
    if not ok then
      LOG_WARN("plugin missing", "luasnip is not installed...")
    end
    if ok then
      snip.unlink_current()
    end
    vim.cmd.stopinsert()
  end,
})

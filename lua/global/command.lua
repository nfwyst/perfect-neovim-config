SET_USER_COMMANDS({
  OpenCurFile = function()
    vim.fn.system({ "open", GET_CURRENT_FILE_PATH(true) })
  end,
  ShowFilePath = function()
    LOG_INFO("current file path is", GET_CURRENT_FILE_PATH(true))
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

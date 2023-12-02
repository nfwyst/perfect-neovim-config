return {
  "mattn/emmet-vim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = "EmmetInstall",
  config = function()
    SET_GLOBAL_OPTS({
      user_emmet_mode = "i",
      user_emmet_install_global = 0,
    })
  end,
}

SET_GLOBAL_OPTIONS({
  user_emmet_mode = "i",
  user_emmet_install_global = 0,
})

AUTOCMD("FileType", {
  pattern = { "html", "typescriptreact", "javascriptreact", "typescript", "javascript" },
  command = "silent!EmmetInstall",
  group = AUTOGROUP("_emmet", { clear = true }),
})

return {
  "mattn/emmet-vim",
  event = "VeryLazy",
}

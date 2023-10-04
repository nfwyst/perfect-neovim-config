local function tabnine_build_path()
  if IS_WINDOWS then
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    return "./dl_binaries.sh"
  end
end

return {
  "codota/tabnine-nvim",
  cond = not IS_VSCODE,
  build = tabnine_build_path(),
  config = function()
    local tabnine = require("tabnine")
    tabnine.setup({
      disable_auto_comment = true,
      accept_keymap = "<c-n>",
      dismiss_keymap = "<c-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = INVALID_FILETYPE,
      log_file_path = nil,
    })
  end,
}
local function init()
  AUTOCMD("VimLeave", {
    group = AUTOGROUP("_gen_leave_", { clear = true }),
    callback = function()
      pcall(os.execute, 'pkill -f "ollama serve"')
    end,
  })
end

return {
  "David-Kunz/gen.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  cmd = "Gen",
  config = function()
    require("gen").model = "codellama"
    init()
  end,
}

AUTOCMD("VimLeave", {
  group = vim.api.nvim_create_augroup("gen_leave", { clear = true }),
  callback = function()
    os.execute('pkill -f "ollama serve"')
  end,
})

return {
  "David-Kunz/gen.nvim",
  cmd = "Gen",
  config = function()
    require("gen").model = "mistral:instruct"
  end,
}

return {
  "David-Kunz/gen.nvim",
  cmd = "Gen",
  config = function()
    require("gen").model = "mistral:instruct"
  end,
}

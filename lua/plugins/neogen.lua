return {
  "danymat/neogen",
  cond = not IS_VSCODE_OR_LEET_CODE,
  dependencies = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
  cmd = "Neogen",
  opts = {
    enabled = true,
    snippet_engine = "luasnip",
  },
}

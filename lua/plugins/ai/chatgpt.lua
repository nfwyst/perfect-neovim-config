return {
  "jackMort/ChatGPT.nvim",
  enabled = not IS_WIN_LINUX and vim.env.OPENAI_API_KEY ~= nil,
  cond = not IS_VSCODE,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "ChatGPT", "ChatGPTEditWithInstruction", "ChatGPTRun" },
  config = function()
    require("chatgpt").setup({
      chat = {
        loading_text = "加载中...",
      },
    })
  end,
}

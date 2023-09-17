return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  enabled = not IS_WINDOWS and vim.env.OPENAI_API_KEY,
  cmd = { "ChatGPT", "ChatGPTEditWithInstruction", "ChatGPTRun" },
  config = function()
    require("chatgpt").setup({
      chat = {
        loading_text = "加载中...",
      },
    })
  end,
}

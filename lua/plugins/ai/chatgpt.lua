return {
  "jackMort/ChatGPT.nvim",
  cond = not IS_WIN_LINUX and HAS_OPENAI_KEY and not IS_VSCODE_OR_LEET_CODE,
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

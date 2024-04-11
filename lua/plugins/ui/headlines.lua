return {
  "lukas-reineke/headlines.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  ft = { "norg", "markdown" },
  dependencies = { "nvim-treesitter" },
  config = function()
    vim.schedule(function()
      SET_HL({
        Headline1 = { bg = "#295715" },
        Headline2 = { bg = "#8d8200" },
        Headline3 = { bg = "#a56106" },
        Headline4 = { bg = "#7e0000" },
        Headline5 = { bg = "#1e0b7b" },
        Headline6 = { bg = "#560b7b" },
      })
      local hl = require("headlines")
      hl.setup({
        markdown = {
          fat_headline_upper_string = "▄",
          fat_headline_lower_string = "▀",
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
        },
      })
      hl.refresh()
    end)
  end,
}

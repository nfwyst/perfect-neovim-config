local function init()
  KEY_MAP("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<cr>"
    else
      return "gf"
    end
  end, { expr = true })
end

return {
  "epwalsh/obsidian.nvim",
  enabled = not IS_WINDOWS,
  cond = not IS_VSCODE,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = "markdown",
  config = function()
    local obsidian = require("obsidian")
    obsidian.setup({
      dir = OBSIDIAN_DIR,
      completion = {
        nvim_cmp = true,
      },
      daily_notes = {
        folder = "dailies",
      },
    })
    init()
  end,
}

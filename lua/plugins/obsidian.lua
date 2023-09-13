KEY_MAP("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<cr>"
  else
    return "gf"
  end
end, { expr = true })

return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    dir = OBSIDIAN_DIR,
    completion = {
      nvim_cmp = true,
    },
    daily_notes = {
      folder = "dailies",
    },
  },
}

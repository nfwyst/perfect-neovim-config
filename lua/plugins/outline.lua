AUTOCMD("FileType", {
  pattern = "Outline",
  command = "silent!set nospell",
  group = AUTOGROUP("_outlines", { clear = true }),
})

return {
  "simrat39/symbols-outline.nvim",
  event = "VeryLazy",
  opts = {
    position = "right",
    width = 20,
    highlight_hovered_item = false,
    show_guides = false,
  },
}

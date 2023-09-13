AUTOCMD({
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufModifiedSet",
}, {
  group = AUTOGROUP("barbecue.updater", {}),
  callback = function()
    pcall(function()
      require("barbecue.ui").update()
    end)
  end,
})

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    create_autocmd = false,
  },
}

local function init()
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
end

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("barbecue").setup({
      create_autocmd = false,
      show_basename = false,
      exclude_filetypes = INVALID_FILETYPE,
      show_navic = not IS_WINDOWS,
      attach_navic = not IS_WINDOWS,
    })
    init()
  end,
}

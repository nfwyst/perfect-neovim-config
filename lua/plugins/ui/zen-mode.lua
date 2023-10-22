local statuscolumn = ""

return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  dependencies = {
    { "utilyre/barbecue.nvim", name = "barbecue" },
  },
  config = function()
    local bui = require("barbecue.ui")
    require("zen-mode").setup({
      window = {
        backdrop = 1,
        width = function()
          return math.min(120, vim.o.columns * 0.75)
        end,
        height = 0.9,
        options = {
          number = false,
          relativenumber = false,
          foldcolumn = "0",
          list = false,
          showbreak = "NONE",
        },
      },
      plugins = {
        options = {
          laststatus = 0,
        },
      },
      on_open = function()
        vim.diagnostic.disable()
        bui.toggle(false)
        statuscolumn = vim.o.statuscolumn
        vim.o.statuscolumn = ""
      end,
      on_close = function()
        vim.diagnostic.enable()
        bui.toggle(true)
        vim.o.statuscolumn = statuscolumn
      end,
    })
  end,
}

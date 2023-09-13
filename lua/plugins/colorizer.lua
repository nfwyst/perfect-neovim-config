return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup({
      "css",
      "less",
      "scss",
      "sass",
      "javascript",
      "javascriptreact",
      "lua",
      "typescript",
      "typescriptreact",
    }, {
      RRGGBBAA = true,
      rgb_fn = true,
      mode = "background",
    })
  end,
}

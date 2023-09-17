local ft = {
  "lua",
  "css",
  "html",
  "less",
  "scss",
  "sass",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

return {
  "norcalli/nvim-colorizer.lua",
  ft = ft,
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup(ft, {
      RRGGBBAA = true,
      rgb_fn = true,
      mode = "background",
    })
  end,
}

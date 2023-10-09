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
  "svelte",
  "yaml",
}

return {
  "norcalli/nvim-colorizer.lua",
  ft = ft,
  config = function()
    require("colorizer").setup(ft, {
      RRGGBBAA = true,
      rgb_fn = true,
      mode = "background",
    })
  end,
}

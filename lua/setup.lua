if not vim.loop.fs_stat(LAZY_PATH) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    LAZY_PATH,
  })
end
vim.opt.rtp:prepend(LAZY_PATH)

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
  { import = "plugins.which-key" },
  { import = "plugins.colorscheme" },
}, {
  install = {
    colorscheme = { "tokyonight", "NeoSolarized" },
  },
  ui = {
    size = { height = 0.7 },
    border = "rounded",
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

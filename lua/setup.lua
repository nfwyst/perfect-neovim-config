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

local status_ok, lazy = pcall(require, "lazy")

if not status_ok then
  LOG_INFO("package manager installing...")
  return
end

lazy.setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
  { import = "plugins.which-key" },
  { import = "plugins.colorscheme" },
  { import = "plugins.ui" },
  { import = "plugins.ai" },
  { import = "plugins.note" },
  { import = "plugins.style" },
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
    frequency = 604800,
  },
  change_detection = {
    notify = false,
  },
})

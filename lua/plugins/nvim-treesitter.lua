return {
  "nvim-treesitter/nvim-treesitter",
  cond = not IS_VSCODE,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    local install = require("nvim-treesitter.install")
    install.prefer_git = false
    configs.setup({
      ensure_installed = TREESITTER_ENSURE_INSTALL, -- one of "all" or a list of languages
      ignore_install = { "" }, -- List of parsers to ignore installing
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    })
  end,
}

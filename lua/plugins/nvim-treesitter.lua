return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    local install = require("nvim-treesitter.install")
    install.prefer_git = false
    configs.setup({
      ensure_installed = "all", -- one of "all" or a list of languages
      ignore_install = TREESITTER_IGNORE, -- List of parsers to ignore installing
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

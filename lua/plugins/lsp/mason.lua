return {
  "williamboman/mason.nvim",
  cond = not IS_VSCODE,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    mason.setup({
      ui = {
        border = "rounded",
        height = 0.7,
        icons = {
          package_installed = "✓",
          package_pending = "◍",
          package_uninstalled = "✗",
        },
      },
    })

    local lspconf = require("mason-lspconfig")
    lspconf.setup({
      ensure_installed = LSP_SERVERS,
      automatic_installation = true,
    })
  end,
}

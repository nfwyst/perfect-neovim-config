return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local mason = require("mason")
    mason.setup({
      ui = {
        border = "rounded",
        height = 0.7,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = LSP_SERVERS,
      automatic_installation = true,
    })

    require("mason-nvim-dap").setup({
      ensure_installed = { "js" },
    })
  end,
}

return {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = {
    "<cmd>Telescope diagnostics bufnr=0<cr>",
    "Document Diagnostics",
  },
  w = {
    "<cmd>lua require('telescope.builtin').diagnostics({ root_dir = cwd })<cr>",
    "Workspace Diagnostics",
  },
  f = { "<cmd>Format<cr>", "Format" },
  F = { "<cmd>EslintFixAll<cr>", "Fix all" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  Q = { "<cmd>lua vim.diagnostic.setqflist()<cr>", "All Quickfix" },
  r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  s = { "<cmd>DocumentSymbols<cr>", "Document Symbols" },
  S = { "<cmd>WorkspaceSymbols<cr>", "Workspace Symbols" },
}

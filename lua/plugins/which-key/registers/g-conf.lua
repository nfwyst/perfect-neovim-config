return {
  i = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
  d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
  D = { "<cmd>Telescope lsp_definitions<cr>", "Telescope definitions" },
  r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Go to references" },
  R = { "<cmd>Telescope lsp_references<cr>", "Telescope references" },
  I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
  l = {
    '<cmd>lua vim.diagnostic.open_float({ border = "rounded", focusable = true })<cr>',
    "Show diagnostic",
  },
  h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover info" },
  s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
  o = { "<c-o>", "Jump back" },
  w = { "<c-i>", "Jump forward" },
  t = { "<c-t>", "Go back" },
  x = { "<cmd>OpenCurFile<cr>", "Open current file" },
}

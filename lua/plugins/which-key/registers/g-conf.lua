local register = {
  c = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
  d = { "<cmd>Telescope lsp_definitions<cr>", "Go to definition with telescope" },
  D = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
  I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
  r = { "<cmd>Telescope lsp_references<cr>", "Go to references" },
  l = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded", focusable = true })<cr>', "Show diagnostic" },
  k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover info" },
  K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
  o = { "<c-o>", "Jump back" },
  w = { "<c-i>", "Jump forward" },
  t = { "<c-t>", "Go back" },
  x = { "<cmd>OpenCurFile<cr>", "Open current file" },
}

return register

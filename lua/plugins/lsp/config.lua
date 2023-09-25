local function init()
  local signs = {
    DiagnosticSignError = { text = " ", texthl = "DiagnosticSignError" },
    DiagnosticSignWarn = { text = " ", texthl = "DiagnosticSignWarn" },
    DiagnosticSignHint = { text = " ", texthl = "DiagnosticSignHint" },
    DiagnosticSignInfo = { text = " ", texthl = "DiagnosticSignInfo" },
  }
  DEFINE_SIGNS(signs)
  local active = {}
  for name, value in pairs(signs) do
    table.insert(active, { name = name, text = value.text })
  end

  local config = {
    virtual_text = false,
    signs = { active = active },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  local with_opt = {
    border = "rounded",
    width = 60,
  }
  vim.diagnostic.config(config)
  local handlers = vim.lsp.handlers
  handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, with_opt)
  handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, with_opt)
end

local function on_attach(client)
  local disable_formatting_lsp = { "tsserver", "lua_ls" }
  if TABLE_CONTAINS(disable_formatting_lsp, client.name) then
    client.server_capabilities.documentFormattingProvider = false
  end
end

local function get_options(cmp_nvim_lsp, server)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local opts = {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
  }
  local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
  if has_custom_opts then
    if server_custom_opts.disabled then
      return nil
    end
    opts = MERGE_TABLE(opts, server_custom_opts)
  end
  return opts
end

local function try_load(conf, exclude_filetypes)
  local try_add = conf.manager.try_add
  conf.manager.try_add = function(config)
    local disabled = TABLE_CONTAINS(exclude_filetypes, vim.bo.filetype)
    if disabled then
      return
    end
    return try_add(config)
  end
end

return {
  "neovim/nvim-lspconfig",
  cond = not IS_VSCODE,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    for _, server in pairs(LSP_SERVERS) do
      local conf = lspconfig[server]
      local opts = get_options(cmp_nvim_lsp, server)
      if not opts then
        goto continue
      end
      conf.setup(opts)
      try_load(conf, opts.exclude_filetypes or {})
      ::continue::
    end

    init()
  end,
}

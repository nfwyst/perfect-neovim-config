local function organize_imports()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { GET_BUFFER_NAME(0) },
  })
end

return {
  root_dir = function(pattern)
    local status_ok, util = pcall(require, "lspconfig/util")
    if not status_ok then
      return WORKSPACE_PATH
    end
    local root = util.root_pattern(".git")(pattern)
    -- local root = util.root_pattern("package.json", "tsconfig.json", ".git")(pattern)
    return root or WORKSPACE_PATH
  end,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  settings = {
    diagnostics = {
      ignoredCodes = { 7016, 80001, 80006, 80007, 2305, 6387, 7044, 1149 },
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

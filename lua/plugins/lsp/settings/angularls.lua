local function get_node_modules(root_dir)
  local root_node = FORMAT_PATH_BY_OS(root_dir .. "/node_modules")
  local stats = vim.loop.fs_stat(root_node)
  if stats == nil then
    return ""
  end
  return root_node
end

local default_node_modules = get_node_modules(vim.fn.getcwd())

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  default_node_modules,
  "--ngProbeLocations",
  default_node_modules,
  "--includeCompletionsWithSnippetText",
  "--includeAutomaticOptionalChainCompletions",
}

return {
  cmd = cmd,
  filetypes = { "javascript" },
  root_dir = require("lspconfig.util").root_pattern(".git", "angular.json"),
  on_new_config = function(new_config)
    new_config.cmd = cmd
  end,
}

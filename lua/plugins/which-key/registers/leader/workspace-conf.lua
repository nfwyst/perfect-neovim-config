return {
  name = "Workspace",
  g = { "<cmd>SetWorkspacePathGlobal<cr>", "Path to global" },
  l = { "<cmd>SetWorkspacePathLocal<cr>", "Path to local" },
  c = { "<cmd>SetWorkspacePathCustom<cr>", "Custom path" },
  p = { "<cmd>lua vim.notify(WORKSPACE_PATH)<cr>", "Preview workspace path" },
}

local function build(name, tp)
  tp = tp or "norg"
  return "<cmd>Neorg keybind " .. tp .. " " .. name .. "<cr>"
end

local function journal(name)
  return function()
    RUN_CMD("Neorg workspace notes")
    RUN_CMD("Neorg journal " .. name)
  end
end

return {
  name = "Neorg",
  t = {
    name = "Neorg task motions",
    u = "Mark as undone",
    p = "Mark as pending",
    d = "Mark as done",
    h = "Mark as hold",
    c = "Mark as cancelled",
    r = "Mark as recurring",
    i = "Mark as important",
    a = "Mark as ambigous",
  },
  i = { "<cmd>Neorg inject-metadata<cr>", "Inject metadata" },
  C = { build("ore.qol.todo_items.todo.task_cycle"), "Cycle task" },
  c = { "<cmd>Neorg toggle-concealer<cr>", "Toggle concealer" },
  n = { build("ore.dirman.new.note"), "Create new note" },
  v = {
    build("ore.esupports.hop.hop-link vsplit"),
    "Jump to link(vertical split)",
  },
  l = {
    name = "Neorg list",
    t = "Toggle list type",
    i = "Invert list",
  },
  m = {
    name = "Neorg mode",
    n = { "<cmd>Neorg mode norg<cr>", "Enter norg mode" },
    h = {
      "<cmd>Neorg mode traverse-heading<cr>",
      "Enter heading traversal mode",
    },
  },
  e = { "<cmd>Neorg export to-file<cr>", "Export markdown" },
  s = { "<cmd>Neorg generate-workspace-summary", "Generate workspace summary" },
  o = { "<cmd>Neorg toc split<cr>", "Open a table of contents" },
  T = { journal("today"), "Journal today" },
  Y = { journal("yesterday"), "Journal yesterday" },
  M = { journal("tomorrow"), "Journal tomorrow" },
}

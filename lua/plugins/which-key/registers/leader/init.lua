local function get_path(name)
  return "plugins.which-key.registers.leader." .. name .. "-conf"
end

local register = {
  b = require(get_path("buffer")),
  g = require(get_path("git")),
  l = require(get_path("lsp")),
  W = require(get_path("workspace")),
  c = {
    name = "Clipboard/Chatgpt",
    b = require(get_path("clipboard")),
    g = require(get_path("chatgpt")),
  },
  d = require(get_path("dap")),
  D = require(get_path("neogen")),
  t = {
    name = "Tel/Term/Todo/TS/TB/Tree",
    s = require(get_path("telescope")),
    m = require(get_path("terminal")),
    d = require(get_path("todo")),
    t = require(get_path("treesitter")),
    n = require(get_path("tabnine")),
    e = require(get_path("tree")),
  },
  a = { "<cmd>Alpha<cr>", "Alpha" },
  e = { "<cmd>NvimTreeToggle<cr>", "File tree" },
  E = { "<cmd>NvimTreeFindFile<cr>", "Location file in tree" },
  w = { "<cmd>w!<cr>", "Save" },
  x = { "<cmd>x<cr>", "Save and quit" },
  q = { "<cmd>silent!q!<cr>", "Force quit" },
  h = { "<cmd>nohlsearch<cr>", "No highlight" },
  f = { "<cmd>FindFiles<cr>", "Find files" },
  F = { "<cmd>FindText<cr>", "Find text" },
  C = { "<cmd>FindTextCursor<cr>", "Find text under cursor" },
  P = { "<cmd>FindTextWithPath<cr>", "Find text by path" },
  p = { "<cmd>Telescope projects<cr>", "Projects" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recently used files" },
  R = { "<cmd>source <afile><cr>", "Reload nvim config" },
  s = { "<cmd>set ignorecase!<cr>", "Toggle case sensitive" },
  o = {
    name = "Obsidian/Outline/Open",
    b = require(get_path("obsidian")),
    p = { "<cmd>OpenCurFile<cr>", "Open current file" },
    t = { "<cmd>SymbolsOutline<cr>", "Outline" },
    i = { "<cmd>e $MYVIMRC<cr>", "Open init.lua" },
    s = { "<cmd>e " .. SNIPPET_PATH .. "/package.json<cr>", "Open snippets" },
  },
}

return register

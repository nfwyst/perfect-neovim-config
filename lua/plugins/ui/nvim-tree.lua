local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function o(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  local tree = api.tree
  local fs = api.fs
  local copy = fs.copy
  local node = api.node
  local open = node.open
  local navigate = node.navigate
  local run = node.run
  local bulk = api.marks.bulk

  local n = {
    { lhs = "<c-]>", rhs = tree.change_root_to_node, opts = o("cd") },
    { lhs = "<c-k>", rhs = node.show_info_popup, opts = o("info") },
    { lhs = "<c-r>", rhs = fs.rename_sub, opts = o("rename: path") },
    { lhs = "<c-t>", rhs = open.tab, opts = o("open in new tab") },
    { lhs = "<c-x>", rhs = open.horizontal, opts = o("open horizontal") },
    { lhs = "[c", rhs = navigate.git.prev, opts = o("prev git") },
    { lhs = "]c", rhs = navigate.git.next, opts = o("next git") },
    { lhs = "<cr>", rhs = open.edit, opts = o("expand node") },
    { lhs = ">", rhs = navigate.sibling.next, opts = o("next sibling") },
    { lhs = "<", rhs = navigate.sibling.prev, opts = o("prev sibling") },
    { lhs = ".", rhs = run.cmd, opts = o("run command") },
    { lhs = "-", rhs = tree.change_root_to_parent, opts = o("up") },
    { lhs = "a", rhs = fs.create, opts = o("new node") },
    { lhs = "A", rhs = copy.absolute_path, opts = o("copy abs path") },
    { lhs = "b", rhs = fs.rename, opts = o("rename: basename") },
    {
      lhs = "B",
      rhs = tree.toggle_no_buffer_filter,
      opts = o("toggle no buffer"),
    },
    { lhs = "c", rhs = copy.node, opts = o("copy: node") },
    {
      lhs = "C",
      rhs = tree.toggle_git_clean_filter,
      opts = o("toggle git clean"),
    },
    { lhs = "d", rhs = fs.remove, opts = o("delete") },
    { lhs = "D", rhs = bulk.delete, opts = o("delete bookmarked") },
    { lhs = "e", rhs = open.no_window_picker, opts = o("open directly") },
    { lhs = "f", rhs = api.live_filter.start, opts = o("filter") },
    { lhs = "F", rhs = api.live_filter.clear, opts = o("clean filter") },
    { lhs = "g?", rhs = tree.toggle_help, opts = o("help") },
    { lhs = "gs", rhs = tree.search_node, opts = o("Search") },
    { lhs = "h", rhs = navigate.parent_close, opts = o("close directory") },
    { lhs = "H", rhs = tree.collapse_all, opts = o("collapse all") },
    {
      lhs = "i",
      rhs = tree.toggle_hidden_filter,
      opts = o("toggle dotfiles"),
    },
    {
      lhs = "I",
      rhs = tree.toggle_gitignore_filter,
      opts = o("toggle ignorefile"),
    },
    { lhs = "J", rhs = navigate.sibling.last, opts = o("last sibling") },
    { lhs = "K", rhs = navigate.sibling.first, opts = o("first sibling") },
    { lhs = "n", rhs = copy.filename, opts = o("copy name") },
    { lhs = "m", rhs = api.marks.toggle, opts = o("toggle bookmark") },
    { lhs = "M", rhs = bulk.move, opts = o("move bookmarked") },
    { lhs = "l", rhs = open.edit, opts = o("expand node") },
    { lhs = "L", rhs = tree.expand_all, opts = o("expand all") },
    { lhs = "o", rhs = run.system, opts = o("open with system") },
    { lhs = "p", rhs = fs.paste, opts = o("paste node") },
    { lhs = "P", rhs = navigate.parent, opts = o("parent directory") },
    { lhs = "q", rhs = tree.close, opts = o("close tree") },
    { lhs = "r", rhs = tree.reload, opts = o("reload") },
    { lhs = "R", rhs = copy.relative_path, opts = o("copy relative path") },
    { lhs = "t", rhs = fs.trash, opts = o("trash") },
    { lhs = "T", rhs = bulk.trash, opts = o("trash bookmarked") },
    {
      lhs = "u",
      rhs = tree.toggle_custom_filter,
      opts = o("toggle custom filter"),
    },
    { lhs = "v", rhs = open.vertical, opts = o("open vertical") },
    { lhs = "x", rhs = fs.cut, opts = o("cut node") },
  }

  SET_KEY_MAPS({ n = n })
end

SET_GLOBAL_OPTS({
  loaded = true,
  loaded_netrw = true,
  loaded_netrwPlugin = true,
})

local function init()
  local nvim_cursor_group = AUTOGROUP("_nvim_cursor_hide", { clear = true })
  SET_AUTOCMDS({
    {
      { "WinEnter", "BufWinEnter" },
      {
        pattern = "NvimTree*",
        group = nvim_cursor_group,
        callback = HIDE_CURSOR,
      },
    },
    {
      { "BufLeave", "WinClosed" },
      {
        pattern = "NvimTree*",
        group = nvim_cursor_group,
        callback = SHOW_CURSOR,
      },
    },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  cond = not IS_VSCODE,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
    "NvimTreeRefresh",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          show = {
            folder_arrow = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {},
          },
        },
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
      },
      diagnostics = {
        enable = false,
        show_on_open_dirs = true,
        severity = {
          min = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = {
          ".DS_Store",
        },
      },
      git = { ignore = false, enable = not IS_WIN_LINUX },
      view = {
        width = {
          max = "35%",
          min = "1%",
        },
        side = "right",
        signcolumn = "auto",
      },
      on_attach = on_attach,
    })
    init()
  end,
}

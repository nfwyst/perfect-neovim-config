local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function get_opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  SET_KEY_MAPS({
    n = {
      {
        lhs = "<C-]>",
        rhs = api.tree.change_root_to_node,
        opts = get_opts("CD"),
      },
      {
        lhs = "<C-e>",
        rhs = api.node.open.replace_tree_buffer,
        opts = get_opts("Open: In Place"),
      },
      {
        lhs = "<C-k>",
        rhs = api.node.show_info_popup,
        opts = get_opts("Info"),
      },
      {
        lhs = "<C-r>",
        rhs = api.fs.rename_sub,
        opts = get_opts("Rename: Omit Filename"),
      },
      {
        lhs = "<C-t>",
        rhs = api.node.open.tab,
        opts = get_opts("Open: New Tab"),
      },
      {
        lhs = "<C-v>",
        rhs = api.node.open.vertical,
        opts = get_opts("Open: Vertical Split"),
      },
      {
        lhs = "<C-x>",
        rhs = api.node.open.horizontal,
        opts = get_opts("Open: Horizontal Split"),
      },
      {
        lhs = "<BS>",
        rhs = api.node.navigate.parent_close,
        opts = get_opts("Close Directory"),
      },
      { lhs = "<CR>", rhs = api.node.open.edit, opts = get_opts("Open") },
      {
        lhs = "<Tab>",
        rhs = api.node.open.preview,
        opts = get_opts("Open Preview"),
      },
      {
        lhs = ">",
        rhs = api.node.navigate.sibling.next,
        opts = get_opts("Next Sibling"),
      },
      {
        lhs = "<",
        rhs = api.node.navigate.sibling.prev,
        opts = get_opts("Previous Sibling"),
      },
      { lhs = ".", rhs = api.node.run.cmd, opts = get_opts("Run Command") },
      {
        lhs = "-",
        rhs = api.tree.change_root_to_parent,
        opts = get_opts("Up"),
      },
      { lhs = "a", rhs = api.fs.create, opts = get_opts("Create") },
      {
        lhs = "bmv",
        rhs = api.marks.bulk.move,
        opts = get_opts("Move Bookmarked"),
      },
      {
        lhs = "B",
        rhs = api.tree.toggle_no_buffer_filter,
        opts = get_opts("Toggle No Buffer"),
      },
      { lhs = "c", rhs = api.fs.copy.node, opts = get_opts("Copy") },
      {
        lhs = "C",
        rhs = api.tree.toggle_git_clean_filter,
        opts = get_opts("Toggle Git Clean"),
      },
      {
        lhs = "[c",
        rhs = api.node.navigate.git.prev,
        opts = get_opts("Prev Git"),
      },
      {
        lhs = "]c",
        rhs = api.node.navigate.git.next,
        opts = get_opts("Next Git"),
      },
      { lhs = "d", rhs = api.fs.remove, opts = get_opts("Delete") },
      { lhs = "D", rhs = api.fs.trash, opts = get_opts("Trash") },
      { lhs = "E", rhs = api.tree.expand_all, opts = get_opts("Expand All") },
      {
        lhs = "e",
        rhs = api.fs.rename_basename,
        opts = get_opts("Rename: Basename"),
      },
      {
        lhs = "]e",
        rhs = api.node.navigate.diagnostics.next,
        opts = get_opts("Next Diagnostic"),
      },
      {
        lhs = "[e",
        rhs = api.node.navigate.diagnostics.prev,
        opts = get_opts("Prev Diagnostic"),
      },
      {
        lhs = "F",
        rhs = api.live_filter.clear,
        opts = get_opts("Clean Filter"),
      },
      { lhs = "f", rhs = api.live_filter.start, opts = get_opts("Filter") },
      { lhs = "g?", rhs = api.tree.toggle_help, opts = get_opts("Help") },
      {
        lhs = "gy",
        rhs = api.fs.copy.absolute_path,
        opts = get_opts("Copy Absolute Path"),
      },
      {
        lhs = "H",
        rhs = api.tree.toggle_hidden_filter,
        opts = get_opts("Toggle Dotfiles"),
      },
      {
        lhs = "I",
        rhs = api.tree.toggle_gitignore_filter,
        opts = get_opts("Toggle Git Ignore"),
      },
      {
        lhs = "J",
        rhs = api.node.navigate.sibling.last,
        opts = get_opts("Last Sibling"),
      },
      {
        lhs = "K",
        rhs = api.node.navigate.sibling.first,
        opts = get_opts("First Sibling"),
      },
      { lhs = "m", rhs = api.marks.toggle, opts = get_opts("Toggle Bookmark") },
      { lhs = "o", rhs = api.node.open.edit, opts = get_opts("Open") },
      {
        lhs = "O",
        rhs = api.node.open.no_window_picker,
        opts = get_opts("Open: No Window Picker"),
      },
      { lhs = "p", rhs = api.fs.paste, opts = get_opts("Paste") },
      {
        lhs = "P",
        rhs = api.node.navigate.parent,
        opts = get_opts("Parent Directory"),
      },
      { lhs = "q", rhs = api.tree.close, opts = get_opts("Close") },
      { lhs = "r", rhs = api.fs.rename, opts = get_opts("Rename") },
      { lhs = "R", rhs = api.tree.reload, opts = get_opts("Refresh") },
      { lhs = "s", rhs = api.node.run.system, opts = get_opts("Run System") },
      { lhs = "S", rhs = api.tree.search_node, opts = get_opts("Search") },
      {
        lhs = "U",
        rhs = api.tree.toggle_custom_filter,
        opts = get_opts("Toggle Hidden"),
      },
      { lhs = "W", rhs = api.tree.collapse_all, opts = get_opts("Collapse") },
      { lhs = "x", rhs = api.fs.cut, opts = get_opts("Cut") },
      { lhs = "y", rhs = api.fs.copy.filename, opts = get_opts("Copy Name") },
      {
        lhs = "Y",
        rhs = api.fs.copy.relative_path,
        opts = get_opts("Copy Relative Path"),
      },
      {
        lhs = "<2-LeftMouse>",
        rhs = api.node.open.edit,
        opts = get_opts("Open"),
      },
      {
        lhs = "<2-RightMouse>",
        rhs = api.tree.change_root_to_node,
        opts = get_opts("CD"),
      },
      { lhs = "l", rhs = api.node.open.edit, opts = get_opts("Open") },
      { lhs = "<cr>", rhs = api.node.open.edit, opts = get_opts("Open") },
      { lhs = "o", rhs = api.node.open.edit, opts = get_opts("Open") },
      {
        lhs = "h",
        rhs = api.node.navigate.parent_close,
        opts = get_opts("Close Directory"),
      },
      {
        lhs = "v",
        rhs = api.node.open.vertical,
        opts = get_opts("Open: Vertical Split"),
      },
    },
  })
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

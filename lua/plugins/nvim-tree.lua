local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
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
      { lhs = "<C-]>", rhs = api.tree.change_root_to_node, opts = opts("CD") },
      { lhs = "<C-e>", rhs = api.node.open.replace_tree_buffer, opts = opts("Open: In Place") },
      { lhs = "<C-k>", rhs = api.node.show_info_popup, opts = opts("Info") },
      { lhs = "<C-r>", rhs = api.fs.rename_sub, opts = opts("Rename: Omit Filename") },
      { lhs = "<C-t>", rhs = api.node.open.tab, opts = opts("Open: New Tab") },
      { lhs = "<C-v>", rhs = api.node.open.vertical, opts = opts("Open: Vertical Split") },
      { lhs = "<C-x>", rhs = api.node.open.horizontal, opts = opts("Open: Horizontal Split") },
      { lhs = "<BS>", rhs = api.node.navigate.parent_close, opts = opts("Close Directory") },
      { lhs = "<CR>", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "<Tab>", rhs = api.node.open.preview, opts = opts("Open Preview") },
      { lhs = ">", rhs = api.node.navigate.sibling.next, opts = opts("Next Sibling") },
      { lhs = "<", rhs = api.node.navigate.sibling.prev, opts = opts("Previous Sibling") },
      { lhs = ".", rhs = api.node.run.cmd, opts = opts("Run Command") },
      { lhs = "-", rhs = api.tree.change_root_to_parent, opts = opts("Up") },
      { lhs = "a", rhs = api.fs.create, opts = opts("Create") },
      { lhs = "bmv", rhs = api.marks.bulk.move, opts = opts("Move Bookmarked") },
      { lhs = "B", rhs = api.tree.toggle_no_buffer_filter, opts = opts("Toggle No Buffer") },
      { lhs = "c", rhs = api.fs.copy.node, opts = opts("Copy") },
      { lhs = "C", rhs = api.tree.toggle_git_clean_filter, opts = opts("Toggle Git Clean") },
      { lhs = "[c", rhs = api.node.navigate.git.prev, opts = opts("Prev Git") },
      { lhs = "]c", rhs = api.node.navigate.git.next, opts = opts("Next Git") },
      { lhs = "d", rhs = api.fs.remove, opts = opts("Delete") },
      { lhs = "D", rhs = api.fs.trash, opts = opts("Trash") },
      { lhs = "E", rhs = api.tree.expand_all, opts = opts("Expand All") },
      { lhs = "e", rhs = api.fs.rename_basename, opts = opts("Rename: Basename") },
      { lhs = "]e", rhs = api.node.navigate.diagnostics.next, opts = opts("Next Diagnostic") },
      { lhs = "[e", rhs = api.node.navigate.diagnostics.prev, opts = opts("Prev Diagnostic") },
      { lhs = "F", rhs = api.live_filter.clear, opts = opts("Clean Filter") },
      { lhs = "f", rhs = api.live_filter.start, opts = opts("Filter") },
      { lhs = "g?", rhs = api.tree.toggle_help, opts = opts("Help") },
      { lhs = "gy", rhs = api.fs.copy.absolute_path, opts = opts("Copy Absolute Path") },
      { lhs = "H", rhs = api.tree.toggle_hidden_filter, opts = opts("Toggle Dotfiles") },
      { lhs = "I", rhs = api.tree.toggle_gitignore_filter, opts = opts("Toggle Git Ignore") },
      { lhs = "J", rhs = api.node.navigate.sibling.last, opts = opts("Last Sibling") },
      { lhs = "K", rhs = api.node.navigate.sibling.first, opts = opts("First Sibling") },
      { lhs = "m", rhs = api.marks.toggle, opts = opts("Toggle Bookmark") },
      { lhs = "o", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "O", rhs = api.node.open.no_window_picker, opts = opts("Open: No Window Picker") },
      { lhs = "p", rhs = api.fs.paste, opts = opts("Paste") },
      { lhs = "P", rhs = api.node.navigate.parent, opts = opts("Parent Directory") },
      { lhs = "q", rhs = api.tree.close, opts = opts("Close") },
      { lhs = "r", rhs = api.fs.rename, opts = opts("Rename") },
      { lhs = "R", rhs = api.tree.reload, opts = opts("Refresh") },
      { lhs = "s", rhs = api.node.run.system, opts = opts("Run System") },
      { lhs = "S", rhs = api.tree.search_node, opts = opts("Search") },
      { lhs = "U", rhs = api.tree.toggle_custom_filter, opts = opts("Toggle Hidden") },
      { lhs = "W", rhs = api.tree.collapse_all, opts = opts("Collapse") },
      { lhs = "x", rhs = api.fs.cut, opts = opts("Cut") },
      { lhs = "y", rhs = api.fs.copy.filename, opts = opts("Copy Name") },
      { lhs = "Y", rhs = api.fs.copy.relative_path, opts = opts("Copy Relative Path") },
      { lhs = "<2-LeftMouse>", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "<2-RightMouse>", rhs = api.tree.change_root_to_node, opts = opts("CD") },
      { lhs = "l", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "<cr>", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "o", rhs = api.node.open.edit, opts = opts("Open") },
      { lhs = "h", rhs = api.node.navigate.parent_close, opts = opts("Close Directory") },
      { lhs = "v", rhs = api.node.open.vertical, opts = opts("Open: Vertical Split") },
    },
  })
end

SET_GLOBAL_OPTIONS({
  loaded = true,
  loaded_netrw = true,
  loaded_netrwPlugin = true,
})

local nvim_cursor_group = AUTOGROUP("_nvim_cursor_hide", { clear = true })
SET_AUTOCMDS({
  {
    { "WinEnter", "BufWinEnter" },
    {
      pattern = "NvimTree*",
      group = nvim_cursor_group,
      callback = function()
        local def = vim.api.nvim_get_hl_by_name("Cursor", true)
        SET_HIGHLIGHT({
          Cursor = vim.tbl_extend("force", def, { blend = 100 }),
        })
        vim.opt.guicursor:append("a:Cursor/lCursor")
      end,
    },
  },
  {
    { "BufLeave", "WinClosed" },
    {
      pattern = "NvimTree*",
      group = nvim_cursor_group,
      callback = function()
        local def = vim.api.nvim_get_hl_by_name("Cursor", true)
        SET_HIGHLIGHT({
          Cursor = vim.tbl_extend("force", def, { blend = 0 }),
        })
        vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
      end,
    },
  },
})

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    update_focused_file = {
      enable = true,
      update_cwd = true,
      update_root = true,
    },
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
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
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            untracked = "",
            deleted = "󰆴",
            ignored = "",
          },
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
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = false,
      severity = {
        min = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
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
    git = { ignore = false },
    view = {
      width = {
        max = "35%",
        min = "25%",
      },
      side = "left",
    },
    on_attach = on_attach,
  },
}

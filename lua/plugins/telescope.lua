local function find_text(path, undercursor)
  local themes = require("telescope.themes")
  local theme = themes.get_ivy({
    layout_config = {
      height = 0.6,
      preview_width = 0.35,
    },
  })
  theme.cwd = WORKSPACE_PATH
  theme.additional_args = function()
    return TELESCOPE_RG_ARGS
  end
  if path then
    theme.search_dir = path
  end
  local builtin = require("telescope.builtin")
  if undercursor then
    builtin.grep_string(theme)
    return
  end
  builtin.live_grep(theme)
end

SET_USER_COMMANDS({
  FindText = find_text,
  FindTextCursor = function()
    find_text(nil, true)
  end,
  FindFiles = function()
    local themes = require("telescope.themes")
    local theme = themes.get_dropdown({ previewer = false, layout_config = TELESCOPE_LAYOUT_CONFIG })
    theme.cwd = WORKSPACE_PATH
    local builtin = require("telescope.builtin")
    builtin.find_files(theme)
  end,
  FindFilesWithGit = function()
    local themes = require("telescope.themes")
    local theme = themes.get_dropdown({ previewer = false, layout_config = TELESCOPE_LAYOUT_CONFIG })
    theme.cwd = WORKSPACE_PATH
    local builtin = require("telescope.builtin")
    builtin.git_files(theme)
  end,
  FindTextWithPath = function()
    vim.ui.input({ prompt = "Enter search dir path:" }, function(path)
      if not path then
        return
      end
      find_text(path)
    end)
  end,
  SetWorkspacePathGlobal = function()
    local _, util = pcall(require, "lspconfig/util")
    WORKSPACE_PATH = util.root_pattern(".git")(vim.fn.expand("%:p")) or vim.loop.cwd()
    print("cwd set to: " .. WORKSPACE_PATH)
  end,
  SetWorkspacePathLocal = function()
    WORKSPACE_PATH = vim.loop.cwd() or ""
    print("cwd set to: " .. WORKSPACE_PATH)
  end,
  SetWorkspacePathCustom = function()
    vim.ui.input({ prompt = "input path: " }, function(path)
      if not path then
        return
      end
      if IS_ABSOLUTE_PATH(path) then
        WORKSPACE_PATH = path
        print("cwd set to: " .. WORKSPACE_PATH)
        return
      end
      local relativePath = vim.loop.cwd()
      WORKSPACE_PATH = string.format("%s" .. OS_SEP .. "%s", relativePath, FORMAT_PATH_BY_OS(path))
      print("cwd set to: " .. WORKSPACE_PATH)
    end)
  end,
})

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope-dap.nvim",
    "ahmedkhalf/project.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.load_extension("dap")
    telescope.load_extension("projects")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "absolute" },
        wrap_results = true,
        preview = {
          filesize_limit = 3,
        },
        file_ignore_patterns = TELESCOPE_IGNORE_PATTERNS,
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
          n = {
            ["<esc>"] = actions.close,
            ["q"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        planets = {
          show_pluto = true,
        },
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    })
  end,
}

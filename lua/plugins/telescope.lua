local function find_text(builtin, themes, path, undercursor)
  local theme = themes.get_ivy({
    layout_config = {
      height = 0.6,
      preview_width = 0.35,
    },
  })
  theme.cwd = WORKSPACE_PATH
  if path then
    theme.search_dir = path
  end
  if undercursor then
    builtin.grep_string(theme)
    return
  end
  builtin.live_grep(theme)
end

local function init(builtin, themes)
  SET_USER_COMMANDS({
    FindText = function(path, undercursor)
      find_text(builtin, themes, path, undercursor)
    end,
    FindTextCursor = function()
      find_text(builtin, themes, nil, true)
    end,
    FindFiles = function()
      local theme = themes.get_dropdown({ previewer = false, layout_config = TELESCOPE_LAYOUT_CONFIG })
      theme.cwd = WORKSPACE_PATH
      builtin.find_files(theme)
    end,
    FindFilesWithGit = function()
      local theme = themes.get_dropdown({ previewer = false, layout_config = TELESCOPE_LAYOUT_CONFIG })
      theme.cwd = WORKSPACE_PATH
      builtin.git_files(theme)
    end,
    FindTextWithPath = function()
      vim.ui.input({ prompt = "Enter search dir path:" }, function(path)
        if not path then
          return
        end
        find_text(builtin, themes, path)
      end)
    end,
    SetWorkspacePathGlobal = SET_WORKSPACE_PATH_GLOBAL,
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
    DocumentSymbols = function()
      builtin.lsp_document_symbols({ symbols = LSP_SYMBOLS })
    end,
    WorkspaceSymbols = function()
      builtin.lsp_dynamic_workspace_symbols({ symbols = LSP_SYMBOLS })
    end,
  })
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = {
    "FindText",
    "FindTextCursor",
    "FindFiles",
    "FindFilesWithGit",
    "FindTextWithPath",
    "Telescope",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-dap.nvim", enabled = DAP_DEBUG_ENABLED },
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    init(require("telescope.builtin"), require("telescope.themes"))

    if DAP_DEBUG_ENABLED then
      telescope.load_extension("dap")
    end
    telescope.load_extension("projects")

    local function flash(prompt_bufnr)
      if not IS_PACKAGE_LOADED("flash") then
        return
      end
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

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
            ["<c-s>"] = flash,
          },
          n = {
            s = flash,
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
        planets = {
          show_pluto = true,
        },
      },
      extensions = {},
    })
  end,
}

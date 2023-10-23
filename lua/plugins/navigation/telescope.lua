local file_layout = { width = 0.85, height = 0.75 }
local text_layout = { height = 0.6, preview_width = 0.35 }
local other_layout = { width = 1000, height = 1000, preview_width = 0.3 }
local picker_opt = { fname_width = 500 }

local function find_text(builtin, themes, path, undercursor)
  local theme = themes.get_ivy({
    layout_config = text_layout,
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

local function find_files(builtin, themes, config)
  local theme =
    themes.get_dropdown({ previewer = false, layout_config = file_layout })
  theme.cwd = WORKSPACE_PATH
  if config ~= nil then
    theme = MERGE_TABLE(theme, config)
  end
  builtin.find_files(theme)
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
      find_files(builtin, themes)
    end,
    FindGitHiddenFiles = function()
      find_files(builtin, themes, { no_ignore = true })
    end,
    FindFilesWithGit = function()
      local theme =
        themes.get_dropdown({ previewer = false, layout_config = file_layout })
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
      LOG_INFO("changing workspace path", "new path: " .. WORKSPACE_PATH)
    end,
    SetWorkspacePathCustom = function()
      vim.ui.input({ prompt = "input path: " }, function(path)
        if not path then
          return
        end
        if IS_ABSOLUTE_PATH(path) then
          WORKSPACE_PATH = path
          LOG_INFO("changing workspace path", "new path: " .. WORKSPACE_PATH)
          return
        end
        local relativePath = vim.loop.cwd()
        WORKSPACE_PATH = string.format(
          "%s" .. OS_SEP .. "%s",
          relativePath,
          FORMAT_PATH_BY_OS(path)
        )
        LOG_INFO("changing workspace path", "new path: " .. WORKSPACE_PATH)
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
  cond = not IS_VSCODE,
  cmd = {
    "FindText",
    "FindTextCursor",
    "FindFiles",
    "FindGitHiddenFiles",
    "FindFilesWithGit",
    "FindTextWithPath",
    "Telescope",
    "SetWorkspacePathGlobal",
    "SetWorkspacePathLocal",
    "SetWorkspacePathCustom",
    "DocumentSymbols",
    "WorkspaceSymbols",
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
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
                ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker =
            require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        wrap_results = true,
        preview = {
          filesize_limit = 3,
        },
        layout_config = { horizontal = other_layout },
        file_ignore_patterns = TELESCOPE_IGNORE_PATTERNS,
        mappings = {
          i = {
            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-c>"] = actions.close,
            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,
            ["<cr>"] = actions.select_default,
            ["<c-x>"] = actions.select_horizontal,
            ["<c-v>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,
            ["<c-u>"] = actions.preview_scrolling_up,
            ["<c-d>"] = actions.preview_scrolling_down,
            ["<c-h>"] = actions.preview_scrolling_left,
            ["<c-l>"] = actions.preview_scrolling_right,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<s-tab>"] = actions.toggle_selection
              + actions.move_selection_better,
            ["<m-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-g>"] = actions.complete_tag,
            ["<c-_>"] = actions.which_key, -- keys from pressing <C-/>
            ["<c-s>"] = flash,
          },
          n = {
            s = flash,
            ["<esc>"] = actions.close,
            ["q"] = actions.close,
            ["<cr>"] = actions.select_default,
            ["<c-x>"] = actions.select_horizontal,
            ["<c-v>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,
            ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<s-tab>"] = actions.toggle_selection
              + actions.move_selection_better,
            ["<m-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<c-u>"] = actions.preview_scrolling_up,
            ["<c-d>"] = actions.preview_scrolling_down,
            ["<c-h>"] = actions.preview_scrolling_left,
            ["<c-l>"] = actions.preview_scrolling_right,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        planets = { show_pluto = true },
        current_buffer_tags = picker_opt,
        jumplist = picker_opt,
        loclist = picker_opt,
        lsp_definitions = picker_opt,
        lsp_document_symbols = picker_opt,
        lsp_dynamic_workspace_symbols = picker_opt,
        lsp_implementations = picker_opt,
        lsp_incoming_calls = picker_opt,
        lsp_outgoing_calls = picker_opt,
        lsp_references = picker_opt,
        lsp_type_definitions = picker_opt,
        lsp_workspace_symbols = picker_opt,
        quickfix = picker_opt,
        tags = picker_opt,
        find_files = { hidden = true },
        git_status = { layout_config = { preview_width = 0.4 } },
      },
      extensions = {},
    })
  end,
}

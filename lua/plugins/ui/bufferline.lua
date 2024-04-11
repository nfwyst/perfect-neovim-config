local function restore_position(bufnr)
  local ft = vim.bo[bufnr].filetype
  local last_known_line = vim.api.nvim_buf_get_mark(bufnr, '"')[1]
  if
    not (ft:match("commit") and ft:match("rebase"))
    and last_known_line > 1
    and last_known_line <= vim.api.nvim_buf_line_count(bufnr)
  then
    vim.api.nvim_feedkeys([[g`"]], "nx", false)
  end
end

local function delete_buffers(num, buffers)
  local compare = function(cur, next)
    local curtime = BUFFER_OPENED_TIME[cur.id] or 0
    local nexttime = BUFFER_OPENED_TIME[next.id] or 0
    return curtime < nexttime
  end
  QUICKSORT(buffers, 1, #buffers, compare)
  for k, v in ipairs(buffers) do
    if k > num then
      return
    end
    vim.schedule(function()
      local is_deleted = BUFFER_OPENED_TIME[v.id] == nil
      if is_deleted then
        return
      end
      require("bufdelete").bufdelete(v.id, false)
    end)
  end
end

local function delete_old_buffers(bufferline)
  local buffers = bufferline.get_elements().elements
  local num_to_delete = #buffers - MAX_BUFFER_NUM
  if num_to_delete <= 0 then
    return
  end
  delete_buffers(num_to_delete, buffers)
end

local function init(bufferline)
  local group = AUTOGROUP("_alpha_and_bufferline_", { clear = true })
  SET_AUTOCMDS({
    {
      "BufReadPost",
      {
        group = group,
        callback = function(event)
          AUTOCMD("BufWinEnter", {
            group = group,
            once = true,
            buffer = event.buf,
            callback = function()
              restore_position(event.buf)
            end,
          })
        end,
      },
    },
    {
      { "BufRead", "BufNewFile" },
      {
        group = group,
        callback = function(event)
          local bufnr = event.buf
          AUTOCMD("BufWinEnter", {
            group = group,
            buffer = bufnr,
            callback = function()
              local is_opened = BUFFER_OPENED_TIME[bufnr] ~= nil
              BUFFER_OPENED_TIME[bufnr] = os.time()
              if is_opened then
                return
              end
              vim.schedule(function()
                PCALL(delete_old_buffers, bufferline)
              end)
            end,
          })
        end,
      },
    },
    {
      "User",
      {
        pattern = "BDeletePost*",
        group = group,
        callback = function(event)
          local bufname = GET_BUFFER_NAME(event.buf)
          local bufft = GET_BUFFER_OPT(event.buf, "filetype")
          local is_empty = bufname == "" and bufft == ""
          if not is_empty then
            return
          end
          local tree_ok, tree_api = pcall(require, "nvim-tree.api")
          if tree_ok then
            tree_api.tree.close()
          end
          RUN_CMD("Alpha")
          RUN_CMD(event.buf .. "bwipeout")
        end,
      },
    },
  })
end

return {
  "akinsho/bufferline.nvim",
  cond = not IS_VSCODE,
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        close_command = "Bdelete",
        right_mouse_command = "Bdelete",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        truncate_names = false,
      },
      highlights = {
        fill = {
          fg = { attribute = "fg", highlight = "Visual" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        buffer_selected = {
          italic = false,
        },
        buffer_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          italic = false,
        },
        close_button = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        tab_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = "#268bd2",
        },
        tab = {
          fg = "#268bd2",
          bg = { attribute = "bg", highlight = "Normal" },
        },
        tab_close = {
          fg = { attribute = "fg", highlight = "TabLineSel" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        duplicate_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
          underline = false,
          italic = false,
        },
        duplicate_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          underline = false,
          italic = false,
        },
        duplicate = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          underline = false,
          italic = false,
        },
        modified = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        modified_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        modified_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        separator = {
          fg = { attribute = "bg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
          fg = { attribute = "bg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        indicator_selected = {
          fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
      },
    })
    init(bufferline)
  end,
}

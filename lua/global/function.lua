local cmd = vim.api.nvim_create_user_command

function MERGE_TABLE(...)
  return vim.tbl_deep_extend("force", ...)
end

function DEFINE_SIGNS(signs)
  for name, sign in pairs(signs) do
    local opt = { text = sign, numhl = "" }
    local is_table = type(sign) == "table"
    if is_table then
      opt = MERGE_TABLE(opt, sign)
    end
    vim.fn.sign_define(name, opt)
  end
end

function SET_USER_COMMANDS(table)
  for k, v in pairs(table) do
    USER_COMMAND(k, v)
  end
end

function USER_COMMAND(name, func)
  cmd(name, func, {})
end

function SET_HIGHLIGHT(table)
  for _, v in ipairs(table) do
    vim.cmd.highlight({ v, bang = true })
  end
end

function SHOW_CURSOR()
  SET_HIGHLIGHT(CURSOR_HILIGHT_OPTS)
end

function HIDE_CURSOR()
  SET_HIGHLIGHT({ "Cursor blend=100" })
end

function SET_BUF_KEY_MAPS(table)
  for mode, maps in pairs(table) do
    for _, v in ipairs(maps) do
      BUF_KEY_MAP(mode, v.lhs, v.rhs, v.opts)
    end
  end
end

function SET_KEY_MAPS(table)
  for mode, maps in pairs(table) do
    for _, v in ipairs(maps) do
      KEY_MAP(mode, v.lhs, v.rhs, v.opts)
    end
  end
end

local function key_exists(mode, lhs)
  local ok, exists = pcall(function(...)
    local keys = require("lazy.core.handler").handlers.keys
    if keys.active[keys.parse(...).id] then
      return true
    end
    return false
  end, { lhs, mode = mode })
  if not ok then
    return false
  end
  return exists
end

function BUF_KEY_MAP(mode, lhs, rhs, opts)
  local has_key = key_exists(mode, lhs)
  if has_key then
    return
  end
  opts = opts or {}
  local silent = opts.silent ~= false
  opts = MERGE_TABLE({ noremap = true, silent = silent }, opts)
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end

function KEY_MAP(mode, lhs, rhs, opts)
  local has_key = key_exists(mode, lhs)
  if has_key then
    return
  end
  opts = opts or {}
  local silent = opts.silent ~= false
  opts = MERGE_TABLE({ noremap = true, silent = silent }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

function SET_GLOBAL_OPTIONS(opts)
  for k, v in pairs(opts) do
    vim.g[k] = v
  end
end

function SET_OPTS(opts, is_local)
  for k, v in pairs(opts) do
    if is_local then
      vim.opt_local[k] = v
    else
      vim.opt[k] = v
    end
  end
end

function TABLE_CONTAINS(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

function SETWORKSPACEPATHGLOBAL()
  local _, util = pcall(require, "lspconfig/util")
  local get_root = util.root_pattern(UNPACK(PROJECT_PATTERNS))
  WORKSPACE_PATH = get_root(vim.fn.expand("%:p")) or vim.loop.cwd()
  print("cwd set to: " .. WORKSPACE_PATH)
end

function UNPACK(table)
  local up = table.unpack or unpack
  return up(table)
end

function IS_ABSOLUTE_PATH(path)
  return string.sub(path, 1, 1) == OS_SEP
end

function SET_AUTOCMDS(list)
  for _, item in ipairs(list) do
    local event = item[1]
    local defs = item[2]
    AUTOCMD(event, defs)
  end
end

function SET_COLORSCHEME(scheme)
  if scheme ~= DEFAULT_COLORSCHEME then
    return
  end
  vim.cmd.colorscheme(DEFAULT_COLORSCHEME)
end

function GET_CURRENT_BUFFER()
  return vim.api.nvim_get_current_buf()
end

function IS_PACKAGE_LOADED(pkg)
  return package.loaded[pkg]
end

function GET_CURRENT_FILE_PATH()
  return vim.fn.expand("%")
end

function SAVE(force, callback)
  local filename = GET_CURRENT_FILE_PATH()
  callback = callback or function() end
  if filename == "" then
    vim.ui.input({ prompt = "Enter a file name: " }, function(fname)
      if not fname then
        vim.notify("No file name, cant save")
      else
        vim.cmd.write({ fname, bang = force ~= false })
        callback()
      end
    end)
  else
    vim.cmd.write({ bang = force ~= false })
    callback()
  end
end

function QUIT(force)
  vim.cmd.quit({ bang = force ~= false })
end

function SAVE_THEN_QUIT(force)
  SAVE(force, function()
    QUIT(force)
  end)
end

function GET_BUFFER_NAME(bufnr)
  return vim.api.nvim_buf_get_name(bufnr)
end

function GET_BUFFER_OPT(bufnr, optname)
  return vim.api.nvim_buf_get_option(bufnr, optname)
end

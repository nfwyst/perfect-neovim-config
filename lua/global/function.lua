local cmd = vim.api.nvim_create_user_command

function MERGE_TABLE(...)
  return vim.tbl_deep_extend("force", ...)
end

function DEFINE_SIGNS(signs)
  for name, sign in pairs(signs) do
    vim.fn.sign_define(name, { text = sign, numhl = "" })
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
  for k, v in pairs(table) do
    vim.api.nvim_set_hl(0, k, v)
  end
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

function SET_OPTS(opts)
  for k, v in pairs(opts) do
    vim.opt[k] = v
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

function SetWorkspacePathGlobal()
  local _, util = pcall(require, "lspconfig/util")
  WORKSPACE_PATH = util.root_pattern(".git")(vim.fn.expand("%:p")) or vim.loop.cwd()
  print("cwd set to: " .. WORKSPACE_PATH)
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

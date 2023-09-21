local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "--" .. str .. "--"
  end,
}

local tabnine = {
  "tabnine",
  fmt = function(str)
    local result = string.gsub(str, " pro", "")
    local is_pro = STR_INCLUDES(str, "pro", 1, true)
    return is_pro and result .. "" or result
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 1,
}

-- cool function for progress
local progress = {
  function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = 0,
}

local spaces = function()
  return "space:" .. GET_BUFFER_OPT(0, "shiftwidth")
end

local lsps = function()
  local clients = vim.lsp.buf_get_clients(GET_CURRENT_BUFFER())
  if next(clients) == nil then
    return ""
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return "\u{f085} " .. table.concat(c, "|")
end

local debugger = {
  function()
    return "  " .. require("dap").status()
  end,
  cond = function()
    return IS_PACKAGE_LOADED("dap") and require("dap").status() ~= ""
  end,
  color = { fg = "#ff9e64" },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = DEFAULT_COLORSCHEME or "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode, branch },
        lualine_b = {
          diagnostics,
          filetype,
          lsps,
          "searchcount",
        },
        lualine_c = {},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          tabnine,
          diff,
          debugger,
          spaces,
          "encoding",
          location,
        },
        lualine_z = { progress },
      },
      tabline = {},
      extensions = {},
    })
  end,
}

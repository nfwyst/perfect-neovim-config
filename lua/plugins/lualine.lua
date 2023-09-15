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
    return string.gsub(str, " pro", "")
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
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = 0,
}

local spaces = function()
  return "space:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsps = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ""
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return "\u{f085} " .. table.concat(c, "|")
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-dap" },
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local dap = require("dap")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = {
          diagnostics,
          filetype,
          lsps,
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          tabnine,
          diff,
          {
            function()
              return "  " .. dap.status()
            end,
            cond = function()
              return dap.status() ~= ""
            end,
            color = { fg = "#ff9e64" },
          },
          spaces,
          "encoding",
        },
        lualine_y = { location },
        lualine_z = { progress },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}

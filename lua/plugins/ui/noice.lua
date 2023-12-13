local function clear_hack()
  SET_TIMEOUT(function()
    require("noice.util.hacks").reset_augroup()
  end)
end

local function init(noice, lsp)
  SET_KEY_MAPS({
    c = {
      {
        lhs = "<c-r>",
        rhs = function()
          noice.redirect(vim.fn.getcmdline())
        end,
        opts = {
          desc = "Redirect Cmdline",
        },
      },
    },
    [{ "i", "n", "s" }] = {
      {
        lhs = "<c-f>",
        rhs = function()
          if not lsp.scroll(4) then
            return "<c-f>"
          end
        end,
        opts = {
          silent = true,
          expr = true,
          desc = "Scroll forward",
        },
      },
      {
        lhs = "<c-b>",
        rhs = function()
          if not lsp.scroll(-4) then
            return "<c-b>"
          end
        end,
        opts = {
          silent = true,
          expr = true,
          desc = "Scroll backward",
        },
      },
    },
  })
  clear_hack()
end

return {
  "folke/noice.nvim",
  cond = not IS_VSCODE,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local M = require("noice.util.call")
    function M:log() end
    local noice = require("noice")
    init(noice, require("noice.lsp"))
    noice.setup({
      health = {
        checker = false,
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" },
              { find = "%d more lines" },
              { find = "%d+L, %d+B" },
              { find = "%d+ lines " },
              { find = "No lines in buffer" },
              { find = "No information available" },
              { find = "not found:" },
              { find = "hit BOTTOM" },
              { find = "hit TOP" },
              { find = "No fold found" },
              { find = "filetype unknown" },
            },
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            any = {
              { find = "method textDocument" },
              { find = "Invalid commentstring" },
              { find = "Client %d quit with" },
            },
          },
          opts = { skip = true },
        },
      },
      messages = {
        view_search = false,
      },
      lsp = {
        hover = {
          silent = true,
        },
        progress = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          auto_open = {
            enabled = not IS_WIN_LINUX,
          },
        },
      },
      views = {
        hover = {
          scrollbar = false,
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          size = { width = LSP_DOC_WIDTH, max_width = GET_MAX_WIDTH() },
          position = { row = 2, col = 2 },
        },
        cmdline_popup = { size = { width = LSP_DOC_WIDTH } },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    })
  end,
}

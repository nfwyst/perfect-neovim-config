local function multi_term(idWithSize, direction)
  local id, size = string.match(idWithSize, "(%S+)%s+(%S+)")
  if not id and not size and not idWithSize then
    return
  end
  local params =
    string.format("%dToggleTerm size=%d direction=%s", not id and idWithSize or id, not size and 80 or size, direction)
  vim.cmd(params)
end

local function set_commands()
  SET_USER_COMMANDS({
    TermKeymap = function()
      SET_BUF_KEY_MAPS({
        t = {
          { lhs = "<esc>", rhs = [[<C-\><C-n>]] },
          { lhs = "jk", rhs = [[<C-\><C-n>]] },
          { lhs = "<C-h>", rhs = [[<C-\><C-n><C-W>h]] },
          { lhs = "<C-j>", rhs = [[<C-\><C-n><C-W>j]] },
          { lhs = "<C-k>", rhs = [[<C-\><C-n><C-W>k]] },
          { lhs = "<C-l>", rhs = [[<C-\><C-n><C-W>l]] },
        },
      })
    end,
    ToggleTerminalHorizontal = function()
      vim.ui.input({ prompt = "please input the id and size for terminal: " }, function(idWithSize)
        if not idWithSize then
          return
        end
        multi_term(idWithSize, "horizontal")
      end)
    end,
    ToggleTerminalVertical = function()
      vim.ui.input({ prompt = "Please input the id and size for terminal: " }, function(idWithSize)
        if not idWithSize then
          return
        end
        multi_term(idWithSize, "vertical")
      end)
    end,
  })
  AUTOCMD("TermOpen", {
    command = "silent!TermKeymap",
    pattern = "term://*",
    group = AUTOGROUP("TermOpen", { clear = true }),
  })
end

local function init_instance(term)
  Terminal = term.terminal.Terminal
  local function newT(cmd)
    return Terminal:new({ cmd = cmd, hidden = true })
  end

  SET_USER_COMMANDS({
    ToggleLazygit = function()
      local lazygit = newT("lazygit")
      lazygit:toggle()
    end,
    ToggleNode = function()
      local node = newT("node")
      node:toggle()
    end,
    ToggleNcdu = function()
      local ncdu = newT("ncdu")
      ncdu:toggle()
    end,
    ToggleHtop = function()
      local htop = newT("htop")
      htop:toggle()
    end,
    TogglePython = function()
      local python = newT("python3")
      python:toggle()
    end,
  })
end

local function bind_powershell()
  SET_OPTS({
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  })
end

local function init(term)
  init_instance(term)
  set_commands()
  if not IS_WINDOWS then
    return
  end
  bind_powershell()
end

return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleNode",
    "ToggleNcdu",
    "ToggleHtop",
    "TogglePython",
    "ToggleTerm",
    "ToggleTerminalHorizontal",
    "ToggleTerminalVertical",
  },
  config = function()
    local toggleterm = require("toggleterm")
    init(toggleterm)
    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}

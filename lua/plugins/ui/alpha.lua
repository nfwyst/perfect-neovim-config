local function footer()
  local handle = io.popen("fortune")
  if not handle then
    return " "
  end
  local fortune = handle:read("*a")
  handle:close()
  return fortune
end

local function init()
  AUTOCMD("User", {
    pattern = "AlphaReady",
    group = AUTOGROUP("_alpha_", { clear = true }),
    callback = function()
      SET_OPTS({ showtabline = 0, cursorline = true }, true)
    end,
  })
end

return {
  "goolord/alpha-nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local bd = require("alpha.themes.dashboard")
    bd.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    bd.section.buttons.val = {
      bd.button("f", "󰱼  Find file", "<cmd>FindFiles<cr>"),
      bd.button("e", "  New file", "<cmd>ene <bar> startinsert<cr>"),
      bd.button("p", "  Find project", "<cmd>Telescope projects<cr>"),
      bd.button(
        "R",
        "  Recently used files global",
        "<cmd>Telescope oldfiles<cr>"
      ),
      bd.button(
        "r",
        "  Recently used files",
        "<cmd>Telescope oldfiles only_cwd=true<cr>"
      ),
      bd.button("t", "󰊄  Find text", "<cmd>FindText<cr>"),
      bd.button("c", "  Configuration", "<cmd>e $MYVIMRC<cr>"),
      bd.button("q", "󰅙  Quit Neovim", "<cmd>qa<cr>"),
    }
    bd.section.footer.val = footer()
    bd.section.footer.opts.hl = ""
    bd.section.header.opts.hl = "Include"
    bd.section.buttons.opts.hl = "Keyword"
    bd.opts.opts.noautocmd = true
    alpha.setup(bd.opts)
    init()
  end,
}

local function footer()
  local handle = io.popen("fortune")
  if not handle then
    return " "
  end
  local fortune = handle:read("*a")
  handle:close()
  return fortune
end

AUTOCMD("User", {
  pattern = "AlphaReady",
  command = "silent!set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2",
  group = AUTOGROUP("_alpha", { clear = true }),
})

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼  Find file", "<cmd>FindFiles<cr>"),
      dashboard.button("e", "  New file", "<cmd>ene <bar> startinsert<cr>"),
      dashboard.button("p", "  Find project", "<cmd>Telescope projects<cr>"),
      dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("t", "󰊄  Find text", "<cmd>FindText<cr>"),
      dashboard.button("c", "  Configuration", "<cmd>e $MYVIMRC<cr>"),
      dashboard.button("q", "󰅙  Quit Neovim", "<cmd>qa<cr>"),
    }
    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = ""
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}

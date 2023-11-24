return {
  "luukvbaal/statuscol.nvim",
  branch = IS_ZERO_TEN_DEV and "0.10" or "main",
  cond = not IS_VSCODE,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local statuscol = require("statuscol")
    local builtin = require("statuscol.builtin")
    statuscol.setup({
      relculright = true,
      foldfunc = "builtin",
      setopt = true,
      ft_ignore = MERGE_ARRAYS(INVALID_FILETYPE, { "git" }),
      segments = {
        {
          text = { builtin.foldfunc, " " },
          maxwidth = 1,
          colwidth = 1,
          click = "v:lua.ScFa",
        },
        {
          sign = {
            name = { "Diagnostic" },
            maxwidth = 1,
            colwidth = 1,
          },
          click = "v:lua.ScSa",
        },
        {
          sign = {
            name = { "todo*" },
            maxwidth = 1,
            colwidth = 1,
          },
          click = "v:lua.ScSa",
        },
        {
          text = { " ", builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        {
          sign = {
            namespace = { "gitsigns" },
            colwidth = 1,
            wrap = true,
          },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}

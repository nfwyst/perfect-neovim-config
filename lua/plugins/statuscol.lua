return {
  "luukvbaal/statuscol.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local statuscol = require("statuscol")
    local builtin = require("statuscol.builtin")
    statuscol.setup({
      relculright = true,
      foldfunc = "builtin",
      setopt = true,
      ft_ignore = INVALID_FILETYPE,
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
        { text = { " ", builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = {
            name = { ".*" },
            colwidth = 2,
          },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}

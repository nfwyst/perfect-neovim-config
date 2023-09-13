return {
  "luukvbaal/statuscol.nvim",
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
          colwidth = 1,
          click = "v:lua.ScFa",
        },
        {
          sign = { name = { "Diagnostic" }, colwidth = 1 },
          click = "v:lua.ScSa",
        },
        { text = { " ", builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { name = { ".*" }, colwidth = 1 },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}

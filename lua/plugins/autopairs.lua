return {
  "windwp/nvim-autopairs",
  cond = not IS_VSCODE,
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      map_char = {
        all = "(",
        tex = "{",
      },
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = INVALID_FILETYPE,
      ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
      enable_moveright = true,
      disable_in_macro = false,
      enable_afterquote = true,
      map_bs = true,
      map_c_w = false,
      disable_in_visualblock = false,
      fast_wrap = {
        map = "<C-]>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    })
    local for_cmp = require("nvim-autopairs.completion.cmp")
    local ok, cmp = pcall(require, "cmp")
    if not ok then
      return
    end
    cmp.event:on(
      "confirm_done",
      for_cmp.on_confirm_done({ map_char = { tex = "" } })
    )
  end,
}

local ftMap = {
  git = "",
  vim = "indent",
  python = { "indent" },
}

local function init(ufo)
  SET_KEY_MAPS({
    n = {
      { lhs = "zR", rhs = ufo.openAllFolds },
      { lhs = "zM", rhs = ufo.closeAllFolds },
      { lhs = "zr", rhs = ufo.openFoldsExceptKinds },
      { lhs = "zm", rhs = ufo.closeFoldsWith },
    },
  })
end

return {
  "kevinhwang91/nvim-ufo",
  cond = not IS_VSCODE,
  event = "VeryLazy",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    local ufo = require("ufo")
    init(ufo)
    ufo.setup({
      provider_selector = function(_, filetype)
        if TABLE_CONTAINS(INVALID_FILETYPE, filetype) then
          return ""
        end
        return ftMap[filetype]
      end,
      preview = {
        mappings = {
          scrollU = "<C-k>",
          scrollD = "<C-j>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
    })
  end,
}

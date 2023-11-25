local function init(ufo)
  SET_KEY_MAPS({
    n = {
      { lhs = "zR", rhs = ufo.openAllFolds },
      { lhs = "zM", rhs = ufo.closeAllFolds },
      { lhs = "zr", rhs = ufo.openFoldsExceptKinds },
      { lhs = "zm", rhs = ufo.closeFoldsWith },
      { lhs = "zp", rhs = ufo.peekFoldedLinesUnderCursor }
    },
  })
end

return {
  "kevinhwang91/nvim-ufo",
  cond = not IS_VSCODE,
  keys = {
    "zR",
    "zM",
    "zr",
    "zm",
    "zp",
    "za",
    "zA",
    "zc",
    "zC",
    "zi",
    "zo",
    "zO",
    "zx",
    "zf",
  },
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    local ufo = require("ufo")
    init(ufo)
    ufo.setup({
      open_fold_hl_timeout = 400,
      close_fold_kinds = { "imports", "comment" },
      provider_selector = function(_, filetype, buftype)
        if filetype == "git" or TABLE_CONTAINS(INVALID_FILETYPE, filetype) then
          return ""
        end
        if
          buftype == "nofile" or TABLE_CONTAINS({ "vim", "python" }, filetype)
        then
          return "indent"
        end

        return function(bufnr)
          local ok, result = pcall(ufo.getFolds, bufnr, "treesitter")
          if ok then
            return result
          end
          if
            type(result) == "string" and result:match("UfoFallbackException")
          then
            return ufo.getFolds(bufnr, "indent")
          else
            return require("promise").reject(result)
          end
        end
      end,
      preview = {
        mappings = {
          scrollU = "<C-k>",
          scrollD = "<C-j>",
          jumpTop = "[",
          jumpBot = "]",
        },
        win_config = {
          winhighlight = "Normal:UfoPreviewNormal,FloatBorder:UfoPreviewBorder,CursorLine:UfoPreviewCursorLine",
          winblend = 0,
        },
      },
    })
  end,
}

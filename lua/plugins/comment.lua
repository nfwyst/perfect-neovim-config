return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    pre_hook = function(ctx)
      local utils = require("Comment.utils")
      local location = nil
      local type = "__default" or "__multiline"
      local cursor_location = require("ts_context_commentstring.utils").get_cursor_location()
      local visual_start_location = require("ts_context_commentstring.utils").get_visual_start_location()

      -- Only calculate commentstring for tsx filetypes
      if vim.bo.filetype == "typescriptreact" then
        if ctx.ctype == utils.ctype.blockwise then
          location = cursor_location
        elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
          location = visual_start_location
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
          key = ctx.ctype == utils.ctype.linewise and type,
          location = location,
        })
      end

      if ctx.ctype == utils.ctype.block then
        location = cursor_location
      elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
        location = visual_start_location
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = ctx.ctype == utils.ctype.line and type,
        location = location,
      })
    end,
  },
}

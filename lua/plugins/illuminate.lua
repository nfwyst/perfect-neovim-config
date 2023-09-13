local function callback()
  local buffer = vim.api.nvim_get_current_buf()
  local ok, illuminate = pcall(require, "illuminate")
  if not ok then
    return
  end
  SET_KEY_MAPS({
    n = {
      {
        lhs = "]]",
        rhs = function()
          illuminate.goto_next_reference(false)
        end,
        opts = { desc = "Next Reference", buffer = buffer },
      },
      {
        lhs = "[[",
        rhs = function()
          illuminate.goto_prev_reference(false)
        end,
        opts = { desc = "Prev Reference", buffer = buffer },
      },
    },
  })
end

AUTOCMD("FileType", { callback = callback })

return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({
      filetypes_denylist = INVALID_FILETYPE,
      large_file_cutoff = MAX_FILE_LENGTH,
      large_file_overrides = {
        providers = { "lsp" },
      },
      under_cursor = false,
    })
  end,
}

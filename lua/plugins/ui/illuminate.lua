local function bind_keymap(illuminate, buffer)
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

local function init(illuminate)
  AUTOCMD("FileType", {
    group = AUTOGROUP("_illuminate_key_", { clear = true }),
    callback = function(event)
      bind_keymap(illuminate, event.buf)
    end,
  })
end

return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")
    init(illuminate)
    illuminate.configure({
      modes_allowlist = { "n", "no", "nt" },
      filetypes_denylist = INVALID_FILETYPE,
      large_file_cutoff = MAX_FILE_LENGTH,
      under_cursor = false,
    })
  end,
}

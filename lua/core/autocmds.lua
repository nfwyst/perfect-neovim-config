local group = AUTOGROUP("_general_settings_", { clear = true })

SET_AUTOCMDS({
  {
    "FileType",
    {
      pattern = {
        "qf",
        "help",
        "gitconfig",
        "man",
        "notify",
        "lspinfo",
        "DressingInput",
        "DressingSelect",
        "DiffviewFileHistory",
      },
      callback = function(event)
        local match = event.match
        if match ~= "gitconfig" then
          vim.cmd.nnoremap("<silent> <buffer> q :close<cr>")
        end
        if IS_WIN_LINUX then
          return
        end
        if match == "help" or match == "gitconfig" then
          vim.opt_local.list = false
        end
      end,
      group = group,
    },
  },
  {
    "TextYankPost",
    {
      pattern = "*",
      callback = function()
        pcall(vim.highlight.on_yank, { higroup = "Visual", timeout = 200 })
      end,
      group = group,
    },
  },
  {
    "BufWinEnter",
    {
      pattern = "*",
      callback = function(event)
        local bufnr = event.buf
        if GET_BUFFER_OPT(bufnr, "buflisted") then
          return
        end
        local filename = GET_BUFFER_NAME(bufnr)
        local is_file = IS_FILE_URI(filename)
        if not is_file then
          return
        end
        vim.opt_local.buflisted = true
      end,
      group = group,
    },
  },
  {
    "FileType",
    {
      pattern = "qf",
      callback = function()
        SET_OPTS({
          buflisted = false,
          relativenumber = false,
        }, true)
      end,
      group = group,
    },
  },
  {
    "FileType",
    {
      pattern = { "lazy", "DressingInput", "DressingSelect" },
      callback = function(event)
        if GET_HIGHLIGHT("Cursor", "blend") == 100 then
          SHOW_CURSOR()
        end
        if
          TABLE_CONTAINS({ "DressingSelect", "DressingInput" }, event.match)
        then
          return
        end
        SET_OPTS({ cursorline = true }, true)
      end,
      group = group,
    },
  },
  {
    "FileType",
    {
      pattern = { "markdown", "gitcommit", "NeogitCommitMessage" },
      callback = function()
        if IS_WIN_LINUX then
          return
        end
        SET_OPTS({ wrap = true, spell = true }, true)
      end,
      group = AUTOGROUP("_markdown_git_", { clear = true }),
    },
  },
  {
    "VimResized",
    {
      pattern = "*",
      command = "silent!tabdo wincmd =",
      group = AUTOGROUP("_auto_resize_", { clear = true }),
    },
  },
})

if not IS_MAC then
  return
end

SET_AUTOCMDS({
  {
    "InsertEnter",
    {
      pattern = "*",
      group = group,
      callback = function()
        SET_OPTS({ cursorline = false }, true)
      end,
    },
  },
  {
    "InsertLeave",
    {
      pattern = "*",
      group = group,
      callback = function()
        SET_OPTS(
          { cursorline = not TABLE_CONTAINS(INVALID_FILETYPE, vim.bo.filetype) },
          true
        )
      end,
    },
  },
})

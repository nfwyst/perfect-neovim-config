local _general_settings = AUTOGROUP("_general_settings", { clear = true })

SET_AUTOCMDS({
  {
    "FileType",
    {
      pattern = { "qf", "help", "gitconfig", "man", "lspinfo", "DressingInput" },
      callback = function(event)
        local match = event.match
        if match ~= "gitconfig" then
          vim.cmd.nnoremap("<silent> <buffer> q :close<cr>")
        end
        if match == "help" or match == "gitconfig" then
          vim.opt_local.list = false
        end
      end,
      group = _general_settings,
    },
  },
  {
    "TextYankPost",
    {
      pattern = "*",
      command = "silent!lua vim.highlight.on_yank({higroup = 'Visual', timeout = 200})",
      group = _general_settings,
    },
  },
  {
    "BufWinEnter",
    {
      pattern = "*",
      callback = function(buf)
        local bufnr = buf.buf
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
      group = _general_settings,
    },
  },
  {
    "FileType",
    {
      pattern = "qf",
      command = "silent!set nobuflisted",
      group = _general_settings,
    },
  },
  {
    "FileType",
    {
      pattern = { "lazy", "DressingInput" },
      callback = function(event)
        if GET_HIGHLIGHT("Cursor", "blend") == 100 then
          SHOW_CURSOR()
        end
        if event.match == "DressingInput" then
          return
        end
        SET_OPTS({ cursorline = true }, true)
      end,
    },
  },
  {
    "FileType",
    {
      pattern = { "markdown", "gitcommit" },
      callback = function()
        if IS_WINDOWS then
          return
        end
        SET_OPTS({ wrap = true, spell = true }, true)
      end,
      group = AUTOGROUP("_markdown_git", { clear = true }),
    },
  },
  {
    "VimResized",
    {
      pattern = "*",
      command = "silent!tabdo wincmd =",
      group = AUTOGROUP("_auto_resize", { clear = true }),
    },
  },
})

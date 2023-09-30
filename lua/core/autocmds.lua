local _general_settings = AUTOGROUP("_general_settings", { clear = true })

SET_AUTOCMDS({
  {
    "FileType",
    {
      pattern = { "qf", "help", "man", "lspinfo" },
      command = "nnoremap <silent> <buffer> q :close<cr>",
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
      command = "silent!set formatoptions-=cro",
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
      pattern = "lazy",
      callback = function()
        SET_OPTS({ cursorline = true }, true)
        if GET_HIGHLIGHT("Cursor").blend == 100 then
          SHOW_CURSOR()
        end
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

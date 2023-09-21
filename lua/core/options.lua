SET_OPTS({
  clipboard = vim.opt.clipboard + "unnamedplus", -- allows neovim to access the system clipboard
  fileencoding = "utf-8", -- the encoding written to a file
  fileencodings = "utf-8", -- the encoding written to a file
  encoding = "utf-8", -- the encoding written to a file
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 7, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- enable convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- specify character width for a tab
  softtabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- enable relative number
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  linebreak = true, -- wrap by word
  sidescrolloff = 8, -- scroll left to right
  inccommand = "split", -- show preview in split window when in %s mode to replace something
  lazyredraw = true, -- don't redraw while executing macros (good performance config)
  redrawtime = 7000, -- redraw timeout, otherwise to set syntax off
  title = true, -- show title
  ch = 0, -- automatically hide and show command line
  spell = false, -- enable builtin spell check that work with treesitter, so it can do well in comment spell checking
  laststatus = 3, -- enable global status line
  foldcolumn = "1", -- '0' is not bad
  foldlevel = 99, -- dont open fold at starting up
  foldlevelstart = 99,
  foldnestmax = 7, -- fold nest dont more than 7, default limit is 20
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  shortmess = vim.opt.shortmess + "c", -- don't give ins-completion-menu messages
  whichwrap = vim.opt.whichwrap + "<,>,[,],h,l", -- keys that allow move the cursor to previous/next line
  background = SCHEME_BACKGROUND,
  guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,a:blinkwait1000-blinkon500-blinkoff250",
  fileformat = IS_WINDOWS and "dos" or "unix",
  fileformats = IS_WINDOWS and "dos" or "unix",
  -- colorcolumn = "81", -- number of column that should be highlight
})

SET_GLOBAL_OPTIONS({
  mapleader = " ",
  maplocalleader = " ",
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  editorconfig = true,
})

SET_TIMEOUT(function()
  SET_HIGHLIGHT(MERGE_ARRAYS(CURSOR_HILIGHT_OPTS, {
    "LineNr guifg=#737aa2",
    "CursorLineNr guifg=#aaaaaa",
  }))
end)

vim.cmd.language("en_US")

SET_OPTS({
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  fileencoding = "utf-8", -- the encoding written to a file
  fileencodings = "utf-8", -- the encoding written to a file
  encoding = "utf-8", -- the encoding written to a file
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- maximum number of entries in a popup
  showmode = false, -- dont show mode since use lualine
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- enable convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- specify character width for a tab
  softtabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = not IS_WIN_LINUX, -- enable relative number
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line, for performance
  linebreak = true, -- wrap by word
  scrolloff = 999, -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8, -- scroll left to right
  inccommand = "split", -- show preview in split window when in %s mode to replace something
  lazyredraw = false, -- don't redraw while executing macros (good performance config), if use noice need to turn this off...
  redrawtime = 1500, -- redraw timeout, otherwise to set syntax off
  title = true, -- show title
  titlestring = "%{fnamemodify(getcwd(), ':t')} - nvim(%{getpid()})",
  ch = 0, -- automatically hide and show command line
  spell = false, -- enable builtin spell check that work with treesitter, so it can do well in comment spell checking
  laststatus = 3, -- enable global status line
  foldcolumn = "1", -- '0' is not bad
  foldlevel = 99, -- dont open fold at starting up
  foldlevelstart = 99,
  foldnestmax = 7, -- fold nest dont more than 7, default limit is 20
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  shortmess = vim.opt.shortmess + "cCIWs", --  flags to shorten/silent vim messages
  whichwrap = vim.opt.whichwrap + "<,>,[,],h,l", -- keys that allowed move the cursor to previous/next line
  background = SCHEME_BACKGROUND,
  guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor",
  guifont = "0xProto Nerd Font Bold:h18",
  autowrite = true, -- enable autowrite
  conceallevel = 3, -- hide * markup
  confirm = true, -- confirm to save changes before exiting modified buffer
  formatoptions = "jcroqlnt", -- tcqj
  grepformat = "%f:%l:%c:%m", -- grep command output format, %f filename, %l row, %c column, %m content
  grepprg = "rg --vimgrep", -- external program for grep, default is ripgrep
  list = not IS_WIN_LINUX, -- show some invisible characters like tabs etc
  listchars = {
    tab = "▓░",
    trail = "•",
    extends = "»",
    precedes = "«",
    nbsp = "░",
  },
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }, -- seesions that will save when exiting
  shiftround = true, -- round indent to multiple of shiftwidth
  splitkeep = "screen", -- keep screen layout not changing
  undolevels = IS_WIN_LINUX and 300 or 10000, -- more big, more undo can do
  wildmode = "longest:full,full", -- command line completion mode
  winminwidth = 5, -- minimum width of window
  showcmd = false,
  ruler = false,
  -- colorcolumn = "81", -- number of column that should be highlight
})

SET_GLOBAL_OPTS({
  mapleader = " ",
  maplocalleader = " ",
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  loaded_node_provider = 0,
  loaded_python3_provider = 0,
  editorconfig = true,
  skip_ts_context_commentstring_module = true,
})

vim.cmd.language("en_US")
vim.lsp.set_log_level(vim.log.levels.OFF)

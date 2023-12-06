DATA_PATH = vim.fn.stdpath("data")
CONFIG_PATH = vim.fn.stdpath("config")
HOME_PATH = vim.fn.expand("~")
AUTOCMD = vim.api.nvim_create_autocmd
AUTOGROUP = vim.api.nvim_create_augroup
WORKSPACE_PATH = vim.loop.cwd()
SCHEME_BACKGROUND = "dark"
MAX_FILE_LENGTH = 1200
MAX_FILE_SIZE = 0.03 -- MiB
IS_VSCODE = vim.g.vscode ~= nil
HAS_OPENAI_KEY = vim.env.OPENAI_API_KEY ~= nil
IS_LEET_CODE = "leetcode.nvim" == vim.fn.argv()[1]
IS_VSCODE_OR_LEET_CODE = IS_VSCODE or IS_LEET_CODE
BIGFILES = {}
OS = jit.os
IS_WINDOWS = OS == "Windows"
IS_MAC = OS == "OSX"
IS_LINUX = OS == "Linux"
IS_WIN_LINUX = IS_LINUX or IS_WINDOWS
OS_SEP = IS_WINDOWS and "\\" or "/"
DEFAULT_COLORSCHEME = "tokyonight"
MAX_BUFFER_NUM = 6
BUFFER_OPENED_TIME = {}
LSP_DOC_WIDTH = 60
VERSION = vim.version()
IS_DEV = VERSION.prerelease == "dev"
MAJOR = VERSION.major
MINOR = VERSION.minor
IS_ZERO_TEN_DEV = IS_DEV and MAJOR == 0 and MINOR == 10
CURSOR_HILIGHT_OPTS = {
  "Cursor guibg=#5f87af ctermbg=67 blend=0",
  "iCursor guibg=#ffffaf ctermbg=229",
  "rCursor guibg=#d70000 ctermbg=124",
}

--- Manual open debug from command line
if DAP_DEBUG_ENABLED == nil then
  DAP_DEBUG_ENABLED = false
end

--- Manual mode doesn't automatically change root directory
if MANUAL_MODE == nil then
  MANUAL_MODE = false
end

function FORMAT_PATH_BY_OS(path)
  return not IS_WINDOWS and path or string.gsub(path, "/", OS_SEP)
end

NOTE_DIR = FORMAT_PATH_BY_OS(HOME_PATH .. "/Documents/notes")
OBSIDIAN_DIR =
  FORMAT_PATH_BY_OS(HOME_PATH .. "/Documents/Obsidian Vault/personal")
OBSIDIAN_WORK_DIR =
  FORMAT_PATH_BY_OS(HOME_PATH .. "/Documents/Obsidian Vault/work")
LAZY_PATH = DATA_PATH .. FORMAT_PATH_BY_OS("/lazy/lazy.nvim")
SNIPPET_PATH = CONFIG_PATH .. FORMAT_PATH_BY_OS("/snippets")

TSX_COMMENT_INCLUDED_FILES = {
  "javascriptreact",
  "typescriptreact",
  "javascript",
  "typescript",
}

LSP_SERVERS = {
  "jsonls",
  "lua_ls",
  "cssls",
  "gopls",
  "html",
  "tsserver",
  "yamlls",
  "tailwindcss",
  "marksman",
  "svelte",
  "bashls",
}

INVALID_FILETYPE = {
  "NvimTree",
  "alpha",
  "Outline",
  "dashboard",
  "qf",
  "help",
  "man",
  "lspinfo",
  "gitcommit",
  "TelescopePrompt",
  "DressingInput",
  "DressingSelect",
  "spectre_panel",
  "startify",
  "Trouble",
  "toggleterm",
  "lazy",
  "noice",
  "notify",
  "NeogitStatus",
  "NeogitCommitMessage",
  "DiffviewFiles",
  "DiffviewFileHistory",
  "mason",
  "",
  nil,
}

TREESITTER_ENSURE_INSTALL = {
  "markdown",
  "markdown_inline",
  "bash",
  "html",
  "json",
  "jsdoc",
  "jsonc",
  "javascript",
  "typescript",
  "tsx",
  "css",
  "scss",
  "regex",
  "yaml",
  "go",
  "lua",
  "svelte",
  "norg",
}

TELESCOPE_IGNORE_PATTERNS = {
  "^.git/",
  "^.dart_tool/",
  "^.github/",
  "^.gradle/",
  "^.idea/",
  "^.settings/",
  "^.vscode/",
  "^.umi/",
  "^.cache/",
  "^.husky/",
  "^.vale/",
  "^smalljre_*/*",
  "^build/*",
  "^lib/*",
  "^env/*",
  "^vendor/*",
  "^dist/*",
  "^temp/*",
  "^gradle/*",
  "^target/*",
  "^node_modules/*",
  "^__snapshots__/*",
  "^__pycache__/*",
  "%.webp",
  "%.lock",
  "%-lock.yaml",
  "%-lock.json",
  "%.sqlite3",
  "%.ipynb",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  "%.pdb",
  "%.dll",
  "%.class",
  "%.exe",
  "%.map",
  "%.cache",
  "%.ico",
  "%.pdf",
  "%.dylib",
  "%.jar",
  "%.docx",
  "%.min.js",
}

PROJECT_PATTERNS = {
  ".git",
  "_darcs",
  ".hg",
  ".bzr",
  ".svn",
  "Makefile",
  "webpack.*js",
  "node_modules",
}

LSP_SYMBOLS = {
  "Class",
  "Function",
  "Method",
  "Constructor",
  "Interface",
  "Module",
  "Struct",
  "Trait",
  "Field",
  "Property",
}

WHICHKEY_MODE = { "x", "n", "o", "v" }

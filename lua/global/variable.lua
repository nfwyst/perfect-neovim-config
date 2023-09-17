DATA_PATH = vim.fn.stdpath("data")
CONFIG_PATH = vim.fn.stdpath("config")
HOME_PATH = vim.fn.expand("~")
AUTOCMD = vim.api.nvim_create_autocmd
AUTOGROUP = vim.api.nvim_create_augroup
TELESCOPE_LAYOUT_CONFIG = { width = 0.85, height = 0.75 }
WORKSPACE_PATH = vim.loop.cwd()
SCHEME_BACKGROUND = "dark"
MAX_FILE_LENGTH = 1000
IS_WINDOWS = string.sub(vim.loop.os_uname().sysname, 1, string.len("Windows")) == "Windows"
OS_SEP = IS_WINDOWS and "\\" or "/"
DEFAULT_COLORSCHEME = "tokyonight"
MAX_BUFFER_SIZE = 100
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

OBSIDIAN_DIR = FORMAT_PATH_BY_OS(HOME_PATH .. "/Documents/Obsidian Vault/personal")
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
  "eslint",
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
  "spectre_panel",
  "startify",
  "neogitstatus",
  "Trouble",
  "DressingInput",
  "toggleterm",
  "",
  nil,
}

TREESITTER_ENSURE_INSTALL = {
  "markdown",
  "markdown_inline",
  "bash",
  "html",
  "json",
  "javascript",
  "typescript",
  "tsx",
  "css",
  "scss",
  "regex",
  "yaml",
  "go",
  "lua",
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
  "smalljre_*/",
  "build/",
  "lib/",
  "env/",
  "vendor/",
  "dist/",
  "temp/",
  "gradle/",
  "target/",
  "node_modules/",
  "__snapshots__/",
  "__pycache__/",
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
  "%.met",
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

DATA_PATH = vim.fn.stdpath("data")
CONFIG_PATH = vim.fn.stdpath("config")
HOME_PATH = vim.fn.expand("~")
AUTOCMD = vim.api.nvim_create_autocmd
AUTOGROUP = vim.api.nvim_create_augroup
TELESCOPE_LAYOUT_CONFIG = { width = 0.85, height = 0.75 }
WORKSPACE_PATH = vim.loop.cwd()
SCHEME_BACKGROUND = "dark"
MAX_FILE_LENGTH = 2000
IS_WINDOWS = string.sub(vim.loop.os_uname().sysname, 1, string.len("Windows")) == "Windows"
OS_SEP = IS_WINDOWS and "\\" or "/"

function FORMAT_PATH_BY_OS(path)
  return not IS_WINDOWS and path or string.gsub(path, "/", OS_SEP)
end

OBSIDIAN_DIR = FORMAT_PATH_BY_OS(HOME_PATH .. "/Documents/Obsidian Vault/personal")
LAZY_PATH = DATA_PATH .. FORMAT_PATH_BY_OS("/lazy/lazy.nvim")
SNIPPET_PATH = CONFIG_PATH .. FORMAT_PATH_BY_OS("/snippets")

LSP_SERVERS = {
  "jsonls",
  "lua_ls",
  "clangd",
  "cmake",
  "cssls",
  "gopls",
  "html",
  "sqlls",
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
  "",
  nil,
}

TREESITTER_IGNORE = {
  "phpdoc",
  "org",
  "norg",
  "pascal",
  "c_sharp",
  "java",
  "kotlin",
  "php",
  "erlang",
  "elixir",
  "julia",
  "fish",
  "fortran",
  "perl",
  "ruby",
  "toml",
  "swift",
  "fusion",
}

TELESCOPE_IGNORE_PATTERNS = {
  "vendor/*",
  "dist/",
  "%.lock",
  "%-lock.yaml",
  "%-lock.json",
  "__pycache__/*",
  "%.sqlite3",
  "%.ipynb",
  "node_modules/*",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  ".git/",
  "%.webp",
  ".dart_tool/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vscode/",
  ".umi/",
  ".cache/",
  ".husky/",
  "__pycache__/",
  "build/",
  "lib/",
  "env/",
  "temp/",
  "gradle/",
  "node_modules/",
  "target/",
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
  "smalljre_*/*",
  ".vale/",
  "__snapshots__",
}

TELESCOPE_RG_ARGS = {
  "--glob=!*.svg",
  "--glob=!yarn.lock",
  "--glob=!pnpm-lock.yaml",
  "--glob=!package-lock.json",
  "--glob=!dist",
  "--glob=!build",
  "--glob=!lib",
  "--glob=!temp",
  "--glob=!.umi",
  "--glob=!.cache",
  "--glob=!.git",
  "--glob=!.github",
  "--glob=!.vscode",
  "--glob=!.husky",
  "--glob=!__snapshots__",
  "--glob=!node_modules",
  "--glob=!*.map",
  "--glob=!*.min.js",
}

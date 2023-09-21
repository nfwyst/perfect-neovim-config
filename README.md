# 💤 perfect-neovim-config

make neovim as a perfect ide for development

# Requirements

1. nodejs
2. neovim 0.8+
3. lazygit -- awesome termial ui for git
4. ncdu -- list file by size
5. htop -- an interactive process viewer
6. python3
7. glow -- for markdown support, preview...
8. gzip
9. wget
11. rust
12. tree-sitter -- for parser generator

# Optional dependencies

1. prettier -- js/ts formatter
2. black -- python formatter
3. stylua -- lua formatter
4. clang_format -- c/c++ formatter
5. eslint -- additional js/ts diagnostic it can work with tsserver lsp, so its ok
6. fortune -- show a random quotation from a collection of quotes in alpha dashboard

# Install

```shell
git clone https://github.com/nfwyst/perfect-neovim-config.git ~/.config/nvim
```

# Use

0. run `:checkhealth` in command mode to check nvim enviroment is ok, you can install missing dependencies by check it
1. run `:Lazy install` in command mode to install all plugins
2. run `:LspInstallInfo` in command mode to install language server protocol manually, it give us language specific completion and diagnostic
3. run `:TSInstall` in command mode to install treesitter, it give us a tons of context syntax highlight support, indent, folds, etc...

# Features

1. file Explorer
2. file/symbol/command/help/register search
3. completion, diagnostic, format
4. git integrates
5. debug
6. navigation
7. toggle terminal in vim
8. outline viewer
9. window/buffer/tab control
10. marks, text objects
11. find and replace all
12. folds, spelling etc...

# Custom snippets

if you want to use your own code snippets, you can create it under snippets folder,
the language tell snippet engine what language to use the snippets specified by path

## create snippets template

you can create your code template, for example in javascript.json:

```json
{
  "setImmediate": {
    "prefix": "sim",
    "body": "setImmediate(() => {\n\t${0}\n})"
  }
}
```

# find and replace all

you can find and replace all with telescope and quickfix list, here is the steps:
1. press ctrl+q add the search result to the quickfix list above telescope view
2. enter `:cdo s/what you want to replace/what you want to be/g | update`, update will write the buffer to disk after replace finished.

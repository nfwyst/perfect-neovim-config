--   command_mode = "c",
SET_KEY_MAPS({
  -- rewrite space to nop
  [""] = {
    { lhs = "<Space>", rhs = "<Nop>" },
  },
  -- normal mode
  n = {
    -- window navigation
    { lhs = "<c-h>", rhs = "<c-w>h" },
    { lhs = "<c-j>", rhs = "<c-w>j" },
    { lhs = "<c-k>", rhs = "<c-w>k" },
    { lhs = "<c-l>", rhs = "<c-w>l" },
    -- resize with arrows
    { lhs = "<m-up>", rhs = "<cmd>resize -2<cr>" },
    { lhs = "<m-down>", rhs = "<cmd>resize +2<cr>" },
    { lhs = "<m-left>", rhs = "<cmd>vertical resize -2<cr>" },
    { lhs = "<m-right>", rhs = "<cmd>vertical resize +2<cr>" },
    -- buffers navigation
    { lhs = "<s-l>", rhs = "<cmd>bnext<cr>" },
    { lhs = "<s-h>", rhs = "<cmd>bprevious<cr>" },
    -- Move text up and down
    { lhs = "<s-j>", rhs = ":m .+1<cr>==" },
    { lhs = "<s-k>", rhs = ":m .-2<cr>==" },
    -- Switch between first column and first character
    { lhs = "0", rhs = "col('.') == 1 ? '^': '0'", opts = { expr = true } },
    { lhs = "n", rhs = "nzz" },
    { lhs = "N", rhs = "Nzz" },
    { lhs = "*", rhs = "*zz" },
    { lhs = "#", rhs = "#zz" },
    { lhs = "g*", rhs = "g*zz" },
    { lhs = "g#", rhs = "g#zz" },
    {
      lhs = "B",
      rhs = "<cmd>call search('\\<', 'b')<cr>",
      opts = { desc = "Previous word" },
    },
    {
      lhs = "E",
      rhs = "<cmd>call search('\\>')<cr>",
      opts = { desc = "Next end of word" },
    },
    {
      lhs = "W",
      rhs = "<cmd>call search('\\<')<cr>",
      opts = { desc = "Next word" },
    },
    {
      lhs = "{",
      rhs = "<cmd>call search('\\(\\n\\n\\|\\%^\\)\\s*\\zs\\S', 'b')<cr>",
      opts = { desc = "Previous start of paragraph" },
    },
    {
      lhs = "}",
      rhs = "<cmd>call search('\\n\\n\\s*\\zs\\S')<cr>",
      opts = { desc = "Next start of paragraph" },
    },
  },
  -- visual mode
  v = {
    -- move text up and down
    { lhs = "<s-j>", rhs = ":m '>+1<cr>gv=gv" },
    { lhs = "<s-k>", rhs = ":m '<-2<cr>gv=gv" },
    -- stay in indent mode when indent
    { lhs = "<", rhs = "<gv^" },
    { lhs = ">", rhs = ">gv^" },
  },
  -- visual block mode
  x = {
    -- move text up and down
    { lhs = "<s-j>", rhs = ":m '>+1<cr>gv=gv" },
    { lhs = "<s-k>", rhs = ":m '<-2<cr>gv=gv" },
  },
  -- insert mode
  i = {
    -- Press jk fast to exit insert mode
    { lhs = "jk", rhs = "<cmd>silent!ExitInsertMode<cr>" },
  },
})

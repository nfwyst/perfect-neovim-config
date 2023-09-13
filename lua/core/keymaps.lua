--   command_mode = "c",
SET_KEY_MAPS({
  -- rewrite space to nop
  [""] = {
    { lhs = "<Space>", rhs = "<Nop>" },
  },
  -- normal mode
  n = {
    -- window navigation
    { lhs = "<C-h>", rhs = "<C-w>h" },
    { lhs = "<C-j>", rhs = "<C-w>j" },
    { lhs = "<C-k>", rhs = "<C-w>k" },
    { lhs = "<C-l>", rhs = "<C-w>l" },
    -- resize with arrows
    { lhs = "<C-Up>", rhs = "<cmd>resize -2<cr>" },
    { lhs = "<C-Down>", rhs = "<cmd>resize +2<cr>" },
    { lhs = "<C-Left>", rhs = "<cmd>vertical resize -2<cr>" },
    { lhs = "<C-Right>", rhs = "<cmd>vertical resize +2<cr>" },
    -- buffers navigation
    { lhs = "<S-l>", rhs = "<cmd>bnext<cr>" },
    { lhs = "<S-h>", rhs = "<cmd>bprevious<cr>" },
    -- Move text up and down
    { lhs = "J", rhs = "<Esc><cmd>m .+1<CR>==gi" },
    { lhs = "K", rhs = "<Esc><cmd>m .-2<CR>==gi" },
    -- Switch between first column and first character
    { lhs = "0", rhs = "col('.') == 1 ? '^': '0'", opts = { expr = true } },
  },
  -- visual mode
  v = {
    -- move text up and down
    { lhs = "J", rhs = "<cmd>m .+1<cr>==" },
    { lhs = "K", rhs = "<cmd>m .-2<cr>==" },
    { lhs = "p", rhs = '"_dP' },
    -- stay in indent mode when indent
    { lhs = "<", rhs = "<gv" },
    { lhs = ">", rhs = ">gv" },
  },
  -- visual block mode
  x = {
    -- move text up and down
    { lhs = "J", rhs = "<cmd>move '>+1<cr>gv-gv" },
    { lhs = "K", rhs = "<cmd>move '<-2<cr>gv-gv" },
  },
  -- insert mode
  i = {
    -- Press jk fast to exit insert mode
    { lhs = "jk", rhs = "<cmd>silent!ExitInsertMode<cr>" },
  },
})

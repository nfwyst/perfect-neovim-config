return {
  name = "Buffers",
  l = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "List Buffer",
  },
  c = {
    "<cmd>Bdelete<cr>",
    "Close Buffer",
  },
}

local normal = {
  gb = "Togggle block comment",
  gbc = "Toggle block comment",
  gc = "Toggle line comment",
  gcc = "Toggle line comment",
  gco = "Comment next line",
  gcO = "Comment prev line",
  gcA = "Comment end of line",
  ["g>"] = "Comment region",
  ["g>c"] = "Add line comment",
  ["g>b"] = "Add block comment",
  ["g<lt>"] = "Uncomment region",
  ["g<lt>c"] = "Remove line comment",
  ["g<lt>b"] = "Remove block comment",
  ["]t"] = {
    "<cmd>lua require('todo-comments').jump_next()<cr>",
    "Next todo comment",
  },
  ["[t"] = {
    "<cmd>lua require('todo-comments').jump_prev()<cr>",
    "Previous todo comment",
  },
}

local visual_block = {
  gb = "Togggle block comment",
  gc = "Toggle line comment",
  ["g>"] = "Comment region",
  ["g<lt>"] = "Uncomment region",
}

return {
  normal = normal,
  visual_block = visual_block,
}

return {
  name = "Terminal",
  n = { "<cmd>ToggleNode<cr>", "Open Node" },
  u = { "<cmd>ToggleNcdu<cr>", "Open NCDU" },
  t = { "<cmd>ToggleHtop<cr>", "Open Htop" },
  p = { "<cmd>TogglePython<cr>", "Open Python" },
  f = { "<cmd>ToggleTerm direction=float<cr>", "Open Float" },
  h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Open Horizontal" },
  v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Open Vertical" },
  H = { "<cmd>lua _HORIZONTAL_TOGGLE()<cr>", "Open Horizontal with id and size" },
  V = { "<cmd>lua _VERTICAL_TOGGLE()<cr>", "Open Vertical with id and size" },
}

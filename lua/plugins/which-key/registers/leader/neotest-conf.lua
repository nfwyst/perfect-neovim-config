return {
  name = "Neotest",
  r = {
    function()
      require("neotest").run.run()
    end,
    "Run",
  },
  s = {
    function()
      require("neotest").run.stop()
    end,
    "Stop",
  },
  o = {
    function()
      require("neotest").output.open()
    end,
    "Open output",
  },
  O = {
    function()
      require("neotest").output.open({ enter = true })
    end,
    "Open output with enter",
  },
  e = {
    function()
      require("neotest").summary.toggle()
    end,
    "Toggle test summary",
  },
  f = {
    function()
      require("neotest").run.run(vim.fn.expand("%"))
    end,
    "Run current file",
  },
  p = {
    function()
      require("neotest").jump.prev({ status = "failed" })
    end,
    "Prev failed test",
    { noremap = false },
  },
  n = {
    function()
      require("neotest").jump.next({ status = "failed" })
    end,
    "Next failed test",
    { noremap = false },
  },
  w = {
    function()
      require("neotest").run.run({ jestCommand = "jest --watch " })
    end,
    "Run in watch",
  },
}

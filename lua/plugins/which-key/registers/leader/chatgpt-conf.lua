local mode = { "n", "v" }

return {
  name = "ChatGpt",
  w = { "<cmd>ChatGPT<cr>", "Open window" },
  p = { "<cmd>ChatGPTActAs<cr>", "Open prompt" },
  e = {
    "<cmd>ChatGPTEditWithInstructions<cr>",
    "Edit with instruction",
    mode = mode,
  },
  g = {
    "<cmd>ChatGPTRun grammar_correction<cr>",
    "Grammar Correction",
    mode = mode,
  },
  t = { "<cmd>ChatGPTRun translate<cr>", "Translate", mode = mode },
  k = { "<cmd>ChatGPTRun keywords<cr>", "Keywords", mode = mode },
  d = { "<cmd>ChatGPTRun docstring<cr>", "Docstring", mode = mode },
  a = { "<cmd>ChatGPTRun add_tests<cr>", "Add Tests", mode = mode },
  o = { "<cmd>ChatGPTRun optimize_code<cr>", "Optimize Code", mode = mode },
  s = { "<cmd>ChatGPTRun summarize<cr>", "Summarize", mode = mode },
  f = { "<cmd>ChatGPTRun fix_bugs<cr>", "Fix Bugs", mode = mode },
  x = { "<cmd>ChatGPTRun explain_code<cr>", "Explain Code", mode = mode },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = mode },
  l = {
    "<cmd>ChatGPTRun code_readability_analysis<cr>",
    "Code Readability Analysis",
    mode = mode,
  },
}

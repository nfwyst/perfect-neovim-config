local function init()
  KEY_MAP("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<cr>"
    else
      return "gf"
    end
  end, { expr = true })
  USER_COMMAND("EnableObsidian", function() end)
end

return {
  "epwalsh/obsidian.nvim",
  cond = not IS_VSCODE_OR_LEET_CODE,
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "EnableObsidian",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianSearch",
    "ObsidianQuickSwitch",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianFollowLink",
    "ObsidianTemplate",
    "ObsidianWorkspace",
  },
  ft = not IS_WIN_LINUX and "markdown" or nil,
  config = function()
    local obsidian = require("obsidian")
    obsidian.setup({
      workspaces = {
        { name = "work", path = OBSIDIAN_WORK_DIR },
        { name = "personal", path = OBSIDIAN_DIR },
      },
      completion = {
        nvim_cmp = true,
      },
      log_level = vim.log.levels.OFF,
      daily_notes = {
        folder = "dailies",
      },
      templates = {
        subdir = "templates",
        -- a map for custom variables, the key should be the variable and the value a function
        substitutions = {
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
        },
      },
    })
    init()
  end,
}

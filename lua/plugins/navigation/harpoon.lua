local function init()
  local ui = require("harpoon.ui")
  SET_HL({ HarpoonBorder = { link = "TelescopeBorder" } })
  SET_USER_COMMANDS({
    AddHarpoonFile = function()
      require("harpoon.mark").add_file()
    end,
    ToggleHarpoonQuickMenu = ui.toggle_quick_menu,
  })
  SET_KEY_MAPS({
    n = { { lhs = "<tab>", rhs = ui.toggle_quick_menu } },
  })
end

return {
  "ThePrimeagen/harpoon",
  cond = not IS_VSCODE,
  cmd = { "Telescope harpoon", "AddHarpoonFile", "ToggleHarpoonQuickMenu" },
  keys = { "<tab>" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    init()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")
  end,
}

local function init()
  SET_USER_COMMANDS({
    AddHarpoonFile = function()
      require("harpoon.mark").add_file()
    end,
    ToggleHarpoonQuickMenu = function()
      require("harpoon.ui").toggle_quick_menu()
    end,
  })
end

return {
  "ThePrimeagen/harpoon",
  cond = not IS_VSCODE,
  cmd = { "Telescope harpoon", "AddHarpoonFile", "ToggleHarpoonQuickMenu" },
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

return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      plugins = {
        spelling = { enabled = true },
      },
    }
  end,
}

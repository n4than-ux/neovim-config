return {
   {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      dependencies = { "neovim/nvim-lspconfig" },
      config = function()
         -- disable default inline text to prevent duplicates
         vim.diagnostic.config({ virtual_text = false })

         require("tiny-inline-diagnostic").setup({
            preset = "modern",   -- "modern" looks clean; others: "minimal", "classic"
            hi = {
               background = "Normal", -- inherits current colorscheme bg
            },
            options = {
               multilines = true, -- show multi-line messages when needed
               show_source = true, -- include LSP source like [lua_ls]
               -- You can tweak symbols if you want:
               -- icons = { error = " ", warn = " ", info = " ", hint = " " },
            },
         })
      end,
   },
}

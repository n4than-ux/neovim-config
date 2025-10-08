return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "lemminx" },
         })
      end,
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         -- Lua LS
         vim.lsp.config.lua_ls.setup({
            cmd = { "lua-language-server" }, -- mason provides this
            capabilities = capabilities,
            settings = {
               Lua = {
                  diagnostics = {
                     globals = { "vim" },
                  },
                  workspace = {
                     library = vim.api.nvim_get_runtime_file("", true),
                     checkThirdParty = false,
                  },
                  telemetry = {
                     enable = false,
                  },
               },
            },
         })

         -- XML LS (lemminx)
         vim.lsp.config.lemminx.setup({
            cmd = { "lemminx" },
            capabilities = capabilities,
            filetypes = { "xml", "xsd", "xsl", "xslt" },
            settings = {
               xml = {
                  format = { enabled = true },
                  validate = { enabled = true },
               },
            },
         })
      end,
   },
}

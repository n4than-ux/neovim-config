return {
	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" },
		config = function()
			require("neodev").setup({})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})
		end,
	},
}

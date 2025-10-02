return {
	{
		"folke/neodev.nvim",
		ft = "lua", -- only load for Lua files
		opts = {}, -- uses default settings
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" },
		config = function()
			-- Setup neodev before lspconfig
			require("neodev").setup({})

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" }, -- because you're in Neovim
						},
						workspace = {
							checkThirdParty = false, -- stop it nagging you
						},
					},
				},
			})
		end,
	},
}

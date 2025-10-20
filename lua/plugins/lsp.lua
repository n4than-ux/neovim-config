return {
	--mason
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "[OK]",
					package_pending = "->",
					package_uninstalled = "[X]",
				},
			},
		},
	},

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
		"folke/neodev.nvim",
		lazy = false, -- load before lspconfig
		priority = 1000,
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					types = true,
					plugins = true,
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua LS
			vim.lsp.config.lua_ls.setup({
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim", "require" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
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
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					--null_ls.builtins.diagnostics.eslint_d,
				},
			})
			vim.keymap.set("n", "<leader>=", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-u>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			-- disable default inline text to prevent duplicates
			vim.diagnostic.config({ virtual_text = false })

			require("tiny-inline-diagnostic").setup({
				preset = "modern", -- "modern" looks clean; others: "minimal", "classic"
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

return {
	--colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = true, -- optional, removes background
				terminal_colors = true, -- sync terminal colors
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
				},
				day_brightness = 0.3, -- this line right here
			})

			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	--which-key
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				plugins = {
					spelling = { enabled = true },
				},
			})
		end,
	},
	--lualine
	{
		"vim-airline/vim-airline",
		dependencies = { "vim-airline/vim-airline-themes", "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Airline settings below
			vim.g.airline_powerline_fonts = 1
			vim.g.airline_theme = "solarized" -- or "base16_gruvbox_dark_hard", whatever fits your colorscheme

			-- Enable tabline (buffer tabs at top)
			vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"

			-- Enable LSP status integration
			vim.g["airline#extensions#lsp#enabled"] = 1

			-- Diagnostics symbols (if using built-in LSP)
			vim.g["airline#extensions#lsp#error_symbol"] = "E:"
			vim.g["airline#extensions#lsp#warning_symbol"] = "W:"

			-- Show file encoding and format
			vim.g["airline_section_x"] = "%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]"

			-- Powerline separators
			vim.g.airline_left_sep = ""
			vim.g.airline_left_alt_sep = ""
			vim.g.airline_right_sep = ""
			vim.g.airline_right_alt_sep = ""

			-- Custom sections (time + buffer)
			-- vim.g.airline_section_b = '%{strftime("%c")}'
			-- vim.g.airline_section_y = 'BN: %{bufnr("%")}'
		end,
	},
	--bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy", -- load lazily
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "none",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					left_trunc_marker = "<-",
					right_trunc_marker = "->",
					max_name_length = 30,
					max_prefix_length = 15,
					tab_size = 21,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thin",
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					sort_by = "id",
				},
			})

			vim.opt.termguicolors = true
			-- Optional keymaps
			vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })

			-- Close current buffer
			vim.keymap.set("n", "<leader>bd", ":bwipeout<CR>", { silent = true })

			-- Close all other buffers
			vim.keymap.set("n", "<leader>bD", ":BufferLineCloseOther<CR>", { silent = true })
		end,
	},
	--indent-blankline
	{
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("ibl").setup({
					indent = {
						char = "|", -- \u2502
					},
					scope = {
						enabled = true,
						show_start = true,
						show_end = true,
					},
					exclude = {
						filetypes = {
							"help",
							"lazy",
							"mason",
							"dashboard",
							"NvimTree",
							"neo-tree",
							"Trouble",
						},
					},
				})
			end,
		},
	},
	--vim-notify
	{
		{
			"rcarriga/nvim-notify",
			lazy = true,
			config = function()
				local notify = require("notify")
				notify.setup({
					stages = "fade_in_slide_out",
					fps = 144,
					timeout = 1000,
					background_colour = "#000000",
					render = "compact",
					top_down = false, -- show newest notifications at the bottom
				})
				vim.notify = notify
			end,
		},
		--noice
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			config = function()
				require("noice").setup({
					lsp = {
						progress = { enabled = true },
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true,
						},
						hover = { enabled = true },
						signature = { enabled = true },
						message = { enabled = true },
					},
					presets = {
						bottom_search = true,
						command_palette = true,
						long_message_to_split = true,
						inc_rename = false,
						lsp_doc_border = true,
					},
					routes = {
						{
							filter = { event = "msg_show", kind = "", find = "written" },
							opts = { skip = true },
						},
						{
							filter = { event = "lsp", kind = "progress" },
							opts = { skip = true },
						},
					},
					cmdline = {
						view = "cmdline_popup",
					},
					views = {
						cmdline_popup = {
							position = {
								row = "50%",
								col = "50%",
							},
							size = {
								width = 60,
								height = "auto",
							},
							border = {
								style = "rounded",
								padding = { 0, 1 }, -- adds breathing room around text
							},
							win_options = {
								winblend = 10, -- adds transparency, softer on eyes
								winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
							},
							zindex = 200, -- ensures it shows above other UI
						},
						popupmenu = {
							relative = "editor",
							position = {
								row = "50%", -- slightly closer to the cmdline, visually tighter
								col = "50%",
							},
							size = {
								width = 60,
								height = 10,
							},
							border = {
								style = "rounded",
								padding = { 0, 1 },
							},
							win_options = {
								winblend = 10, -- same transparency for consistency
								winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,PmenuSel:Visual",
								cursorline = true, -- highlight selected item
							},
							zindex = 200,
						},
					},
					health = {
						checker = false, -- disables startup spam
					},
				})
			end,
		},
	},
   --rainbow-bracket
	{
		"HiPhish/nvim-ts-rainbow2",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			-- Rainbow is set up through treesitter, not directly
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					-- Highlight groups (you can customize your own colors if you want)
					query = "rainbow-parens",
					strategy = require("ts-rainbow.strategy.global"),
				},
			})
		end,
	},
}

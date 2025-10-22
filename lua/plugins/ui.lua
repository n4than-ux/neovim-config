return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true, -- removes background
			terminal_colors = true, -- sync terminal colors
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
			},
			day_brightness = 1,
		},
		config = function()
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				spelling = { enabled = true },
			},
		},
		keys = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {
			options = {
				numbers = "none",
				left_trunc_marker = "<-",
				right_trunc_marker = "->",
				max_name_length = 30,
				max_prefix_length = 15,
				tab_size = 20,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
			},
		},
		keys = {
			{ "<S-l>", ":BufferLineCycleNext<CR>", { silent = true } },
			{ "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true } },
			{ "<leader>bd", ":bdelete<CR>", { silent = true } },
			{ "<leader>bD", ":BufferLineCloseOther<CR>", { silent = true } },
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = { char = "|" },
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
		},
	},

	{
		"rcarriga/nvim-notify",
		lazy = true,
		opts = {
			stages = "fade_in_slide_out",
			fps = 144,
			timeout = 1000,
			background_colour = "#000000",
			render = "default",
			top_down = false, -- newest notifications at the bottom
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
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
			cmdline = { view = "cmdline_popup" },
			views = {
				cmdline_popup = {
					position = { row = "50%", col = "50%" },
					size = { width = 60, height = "auto" },
					border = { style = "rounded", padding = { 0, 1 } },
					win_options = {
						winblend = 10,
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					},
					zindex = 200,
				},
				popupmenu = {
					relative = "editor",
					position = { row = "50%", col = "50%" },
					size = { width = 60, height = 10 },
					border = { style = "rounded", padding = { 0, 1 } },
					win_options = {
						winblend = 10,
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,PmenuSel:Visual",
						cursorline = true,
					},
					zindex = 200,
				},
			},
			health = { checker = false },
		},
	},

	{
		"HiPhish/rainbow-delimiters.nvim",
		opts = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			return {
				strategy = {
					[""] = rainbow_delimiters.strategy.global,
					-- vim = rainbow_delimiters.strategy.local,
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
		config = function(_, opts)
			vim.g.rainbow_delimiters = opts
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = { latex = { enabled = false } },
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
}

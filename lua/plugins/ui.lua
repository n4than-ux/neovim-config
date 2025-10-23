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
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "solarized_dark",
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
				diagnostic = "nvim_lsp",
				diagnostics_indicator = function(count)
					return "(" .. count .. ")"
				end,
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
		config = function()
			vim.notify = require("notify")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp_doc_border = true,
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

	{
		"mhinz/vim-startify",
		opts = {},
		config = function() end,
	},

	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
		opts = {
			enabled = true,

			-- Disable this if you wants to debug highlighting issues
			disable_warnings = true,

			refresh_interval_ms = 8,

			overwrite = {
				-- Automatically map keys to overwrite operations
				-- If set to false, you will need to call the API functions to trigger the animations
				-- WARN: You should disable this if you have already mapped these keys
				--        or if you want to use the API functions to trigger the animations
				auto_map = true,

				-- For search and paste, you can easily modify the animation to suit your needs
				-- For example you can set a table to default_animation with custom parameters:
				-- default_animation = {
				--     name = "fade",
				--
				--     settings = {
				--         max_duration = 1000,
				--         min_duration = 1000,
				--
				--         from_color = "DiffDelete",
				--         to_color = "Normal",
				--     },
				-- },
				-- settings needs to respect the animation you choose settings
				--
				-- All "mapping" needs to have a correct lhs.
				-- It will try to automatically use what you already defined before.
				yank = {
					enabled = true,
					default_animation = "fade",
				},
				search = {
					enabled = false,
					default_animation = "pulse",

					-- Keys to navigate to the next match
					next_mapping = "n",

					-- Keys to navigate to the previous match
					prev_mapping = "N",
				},
				paste = {
					enabled = true,
					default_animation = "reverse_fade",

					-- Keys to paste
					paste_mapping = "p",

					-- Keys to paste above the cursor
					Paste_mapping = "P",
				},
				undo = {
					enabled = false,

					default_animation = {
						name = "fade",

						settings = {
							from_color = "DiffDelete",

							max_duration = 500,
							min_duration = 500,
						},
					},
					undo_mapping = "u",
				},
				redo = {
					enabled = false,

					default_animation = {
						name = "fade",

						settings = {
							from_color = "DiffAdd",

							max_duration = 500,
							min_duration = 500,
						},
					},

					redo_mapping = "<c-r>",
				},
			},

			support = {
				-- Enable support for gbprod/substitute.nvim
				-- You can use it like so:
				-- require("substitute").setup({
				--     on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
				--     highlight_substituted_text = {
				--         enabled = false,
				--     },
				--})
				substitute = {
					enabled = false,

					-- Can also be a table. Refer to overwrite.search for more information
					default_animation = "fade",
				},
			},

			-- Animations for other operations
			presets = {
				-- Enable animation on cursorline when an event in `on_events` is triggered
				-- Similar to `pulsar.el`
				pulsar = {
					enabled = false,
					on_events = { "CursorMoved", "CmdlineEnter", "WinEnter" },
					default_animation = {
						name = "fade",

						settings = {
							max_duration = 1000,
							min_duration = 1000,

							from_color = "DiffDelete",
							to_color = "Normal",
						},
					},
				},
			},

			-- Only use if you have a transparent background
			-- It will override the highlight group background color for `to_color` in all animations
			transparency_color = nil,
			-- Animation configurations
			animations = {
				fade = {
					max_duration = 400,
					min_duration = 300,
					easing = "outQuad",
					chars_for_max_duration = 10,
					from_color = "Visual", -- Highlight group or hex color
					to_color = "Normal", -- Same as above
				},
				reverse_fade = {
					max_duration = 380,
					min_duration = 300,
					easing = "outBack",
					chars_for_max_duration = 10,
					from_color = "Visual",
					to_color = "Normal",
				},
				bounce = {
					max_duration = 500,
					min_duration = 400,
					chars_for_max_duration = 20,
					oscillation_count = 1,
					from_color = "Visual",
					to_color = "Normal",
				},
				left_to_right = {
					max_duration = 350,
					min_duration = 350,
					min_progress = 0.85,
					chars_for_max_duration = 25,
					lingering_time = 50,
					from_color = "Visual",
					to_color = "Normal",
				},
				pulse = {
					max_duration = 600,
					min_duration = 400,
					chars_for_max_duration = 15,
					pulse_count = 2,
					intensity = 1.2,
					from_color = "Visual",
					to_color = "Normal",
				},
				rainbow = {
					max_duration = 600,
					min_duration = 350,
					chars_for_max_duration = 20,
				},

				-- You can add as many animations as you want
				custom = {
					-- You can also add as many custom options as you want
					-- Only `max_duration` and `chars_for_max_duration` is required
					max_duration = 350,
					chars_for_max_duration = 40,

					color = hl_visual_bg,

					-- Custom effect function
					-- @param self table The effect object
					-- @param progress number The progress of the animation [0, 1]
					--
					-- Should return a color and a progress value
					-- that represents how much of the animation should be drawn
					-- self.settings represents the settings of the animation that you defined above
					effect = function(self, progress)
						return self.settings.color, progress
					end,
				},
				hijack_ft_disabled = {
					"alpha",
					"snacks_dashboard",
				},
			},
			virt_text = {
				priority = 2048,
			},
		},
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				view = {
					stack_upwards = true, -- Display notification items from bottom to top
					align = "message", -- Indent messages longer than a single line
					reflow = false, -- Reflow (wrap) messages wider than notification window
					icon_separator = " ", -- Separator between group name and icon
					group_separator = "---", -- Separator between notification groups
					-- Highlight group used for group separator
					group_separator_hl = "Comment",
					line_margin = 1, -- Spaces to pad both sides of each non-empty line
					-- How to render notification messages
					render_message = function(msg, cnt)
						return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
					end,
				},
				window = {
					normal_hl = "Comment", -- Base highlight group in the notification window
					winblend = 100, -- Background color opacity in the notification window
					border = "none", -- Border around the notification window
					zindex = 45, -- Stacking priority of the notification window
					max_width = 0, -- Maximum width of the notification window
					max_height = 0, -- Maximum height of the notification window
					x_padding = 1, -- Padding from right edge of window boundary
					y_padding = 0, -- Padding from bottom edge of window boundary
					align = "bottom", -- How to align the notification window
					relative = "editor", -- What the notification window position is relative to
					tabstop = 8, -- Width of each tab character in the notification window
					avoid = {"NvimTree"}, -- Filetypes the notification window should avoid
					-- e.g., { "aerial", "NvimTree", "neotest-summary" }
				},
			},
		},
	},

	{
		"folke/twilight.nvim",
		opts = {
			{
				dimming = {
					alpha = 0.25, -- amount of dimming
					-- we try to get the foreground from the highlight groups or fallback color
					color = { "Normal", "#ffffff" },
					term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
					inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
				},
				context = 10, -- amount of lines we will try to show around the current line
				treesitter = true, -- use treesitter when available for the filetype
				-- treesitter is used to automatically expand the visible text,
				-- but you can further control the types of nodes that should always be fully expanded
				expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
					"function",
					"method",
					"table",
					"if_statement",
				},
				exclude = {}, -- exclude these filetypes
			},
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*", -- apply to all file type
			DEFAULT_OPTIONS = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode.
			},
		},
	},
}

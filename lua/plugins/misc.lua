return {
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},

	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
		keys = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "master",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "lua", "javascript", "html", "css" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 1000,
			},
		},
	},

	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},

	{
		"petertriho/nvim-scrollbar",
		opts = {
			show = true,
			show_in_active_only = false,
			set_highlights = true,
			folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
			max_lines = false, -- disables if no. of lines in buffer exceeds this
			hide_if_all_visible = false, -- Hides everything if all lines are visible
			throttle_ms = 100,
			handle = {
				text = " ",
				blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
				color = nil,
				color_nr = nil, -- cterm
				highlight = "CursorColumn",
				hide_if_all_visible = true, -- Hides handle if all lines are visible
			},
			marks = {
				Cursor = {
					text = "•",
					priority = 0,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "Normal",
				},
				Search = {
					text = { "-", "=" },
					priority = 1,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "Search",
				},
				Error = {
					text = { "-", "=" },
					priority = 2,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "DiagnosticVirtualTextError",
				},
				Warn = {
					text = { "-", "=" },
					priority = 3,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "DiagnosticVirtualTextWarn",
				},
				Info = {
					text = { "-", "=" },
					priority = 4,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "DiagnosticVirtualTextInfo",
				},
				Hint = {
					text = { "-", "=" },
					priority = 5,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "DiagnosticVirtualTextHint",
				},
				Misc = {
					text = { "-", "=" },
					priority = 6,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "Normal",
				},
				GitAdd = {
					text = "┆",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsAdd",
				},
				GitChange = {
					text = "┆",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsChange",
				},
				GitDelete = {
					text = "▁",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsDelete",
				},
			},
			excluded_buftypes = {
				"terminal",
			},
			excluded_filetypes = {
				"blink-cmp-menu",
				"dropbar_menu",
				"dropbar_menu_fzf",
				"DressingInput",
				"cmp_docs",
				"cmp_menu",
				"noice",
				"prompt",
				"TelescopePrompt",
			},
			autocmd = {
				render = {
					"BufWinEnter",
					"TabEnter",
					"TermEnter",
					"WinEnter",
					"CmdwinLeave",
					"TextChanged",
					"VimResized",
					"WinScrolled",
				},
				clear = {
					"BufWinLeave",
					"TabLeave",
					"TermLeave",
					"WinLeave",
				},
			},
			handlers = {
				cursor = true,
				diagnostic = true,
				gitsigns = false, -- Requires gitsigns
				handle = true,
				search = false, -- Requires hlslens
				ale = false, -- Requires ALE
			},
		},
	},

	{
		"kevinhwang91/nvim-hlslens",
		opts = {
			{
				auto_enable = {
					description = [[Enable nvim-hlslens automatically]],
					default = true,
				},
				enable_incsearch = {
					description = [[When `incsearch` option is on and enable_incsearch is true, add lens
            for the current matched instance]],
					default = true,
				},
				calm_down = {
					description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
					default = false,
				},
				nearest_only = {
					description = [[Only add lens for the nearest matched instance and ignore others]],
					default = false,
				},
				nearest_float_when = {
					description = [[When to open the floating window for the nearest lens.
            'auto': floating window will be opened if room isn't enough for virtual text;
            'always': always use floating window instead of virtual text;
            'never': never use floating window for the nearest lens]],
					default = "auto",
				},
				float_shadow_blend = {
					description = [[Winblend of the nearest floating window. `:h winbl` for more details]],
					default = 50,
				},
				virt_priority = {
					description = [[Priority of virtual text, set it lower to overlay others.
        `:h nvim_buf_set_extmark` for more details]],
					default = 100,
				},
				override_lens = {
					description = [[Hackable function for customizing the lens. If you like hacking, you
            should search `override_lens` and inspect the corresponding source code.
            There's no guarantee that this function will not be changed in the future. If it is
            changed, it will be listed in the CHANGES file.
            @param render table an inner module for hlslens, use `setVirt` to set virtual text
            @param splist table (1,1)-indexed position
            @param nearest boolean whether nearest lens
            @param idx number nearest index in the plist
            @param relIdx number relative index, negative means before current position,
                                  positive means after
        ]],
					default = nil,
				},
			},
		},
	},
}

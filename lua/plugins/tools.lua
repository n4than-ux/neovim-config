return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		opts = {},
		keys = {
			{
				"<leader>ff",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files()
				end,
				desc = "Telescope Find Files",
			},
			{
				"<leader>fg",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
				desc = "Telescope Live Grep",
			},
			{
				"<leader>fb",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "List All Buffers",
			},
			{
				"<leader>fh",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Telescope Help",
			},
			{
				"<leader>gc",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_commits()
				end,
				desc = "Git Commit (Telescope)",
			},
			{
				"<leader>gs",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_status()
				end,
				desc = "Git Status (Telescope)",
			},
			{
				"<leader>lr",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_references()
				end,
				desc = "LSP References (Telescope)",
			},
			{
				"<leader>ld",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_definitions()
				end,
				desc = "LSP Definitions (Telescope)",
			},
			{
				"<leader>li",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_implementations()
				end,
				desc = "LSP Implementations (Telescope)",
			},
			{
				"<leader>ls",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_document_symbols()
				end,
				desc = "LSP Document Symbols (Telescope)",
			},
			{
				"<leader>km",
				function()
					local builtin = require("telescope.builtin")
					builtin.keymaps()
				end,
				desc = "Show keymaps (Telescope)",
			},
			{
				"<leader>ch",
				function()
					local builtin = require("telescope.builtin")
					builtin.command_history()
				end,
				desc = "Show Commands History (Telescope)",
			},
		},
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {}, -- leave empty for defaults
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / References / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>e", ":Neotree toggle<CR>", silent = true, desc = "Toggle neotree" },
		},
		config = function()
			-- set transparency for neotree
			local function set_transparency()
				vim.cmd([[
            hi! NeoTreeNormal guibg=NONE ctermbg=NONE
            hi! NeoTreeNormalNC guibg=NONE ctermbg=NONE
            hi! NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
         ]])
			end

			set_transparency()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = set_transparency,
			})
		end,
	},

	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<F12>", ":FloatermToggle<CR>", desc = "Toggle Floaterm" },
			{ "<leader>ft", ":FloatermToggle<CR>", desc = "Toggle Floaterm" },
			{ "<leader>fn", ":FloatermNext<CR>", desc = "Next Floaterm" },
			{ "<leader>fp", ":FloatermPrev<CR>", desc = "Previous Floaterm" },
		},
		config = function()
			-- Basic settings
			vim.g.floaterm_width = 0.9
			vim.g.floaterm_height = 0.6
			vim.g.floaterm_position = "center"
			vim.g.floaterm_autoclose = 1
			vim.g.floaterm_opener = "edit"

			-- Keymaps inside terminal
			vim.cmd([[
        tnoremap <Esc> <C-\><C-n>
        tnoremap <C-h> <C-\><C-n><C-w>h
        tnoremap <C-j> <C-\><C-n><C-w>j
        tnoremap <C-k> <C-\><C-n><C-w>k
        tnoremap <C-l> <C-\><C-n><C-w>l
      ]])
		end,
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {
			auto_enable = true,
			preview = {
				win_height = 12,
				win_vheight = 12,
				delay_syntax = 80,
				border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			func_map = {
				vsplit = "<C-v>",
				ptogglemode = "z,",
				stoggleup = "",
			},
			filter = {
				fzf = {
					action_for = { ["ctrl-s"] = "split" },
					extra_opts = { "--bind", "ctrl-o:toggle-all" },
				},
			},
		},
		keys = {
			{ "<leader>fo", "<cmd>copen<cr>", desc = "Open Quickfix" },
			{ "<leader>fc", "<cmd>cclose<cr>", desc = "Close Quickfix" },
			{ "<leader>fn", "<cmd>cnext<cr>", desc = "Next Quickfix item" },
			{ "<leader>fp", "<cmd>cprev<cr>", desc = "Previous Quickfix item" },
		},
	},
}

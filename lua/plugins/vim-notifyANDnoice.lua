return {
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
}

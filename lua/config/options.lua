-- General Editing
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.cmd("set softtabstop=3")
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scroll = 10
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.backspace = { "indent", "eol", "start" }

-- UI & Appearance
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = ""

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- File Handling & Safety
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Misc / Fix noisy LSP messages
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end

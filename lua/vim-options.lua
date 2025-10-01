-----------------------------------------------------------
-- General Editing
-----------------------------------------------------------
vim.opt.expandtab = true -- use spaces, not tabs
vim.opt.shiftwidth = 3 -- indent size
vim.opt.tabstop = 3
vim.cmd("set softtabstop=3")
vim.opt.smartindent = true -- auto-indent new lines
vim.opt.wrap = false -- no line wrapping
vim.opt.scrolloff = 8 -- keep 8 lines visible above/below
vim.opt.sidescrolloff = 8 -- keep 8 cols visible left/right
vim.opt.signcolumn = "yes"
vim.opt.backspace = { "indent", "eol", "start" } -- smarter backspace

-----------------------------------------------------------
-- UI & Appearance
-----------------------------------------------------------
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.number = true -- show line numbers
vim.opt.number = true -- show relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.mouse = "a" -- enable mouse support

-- line number highlights
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-----------------------------------------------------------
-- Tab Navigation
-----------------------------------------------------------
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Go to next tab", silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab", silent = true })

-- Open new tab
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "Open new tab", silent = true })

-- Close current tab
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", { desc = "Close current tab", silent = true })

-- Go to specific tabs 1-9
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i, silent = true })
end

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
vim.opt.hlsearch = true -- highlight matches
vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- case-insensitive search...
vim.opt.smartcase = true -- ...unless capital letters

-- clear highlight with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })

-----------------------------------------------------------
-- File Handling & Safety
-----------------------------------------------------------
vim.opt.hidden = true -- keep buffers in background
vim.opt.confirm = true -- confirm before exiting unsaved
vim.opt.swapfile = false -- no swapfiles
vim.opt.undofile = true -- persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- better sessions

-----------------------------------------------------------
-- Performance
-----------------------------------------------------------
vim.opt.updatetime = 250 -- faster diagnostics & events
vim.opt.timeoutlen = 300 -- shorter mapping timeout

-----------------------------------------------------------
-- Clipboard
-----------------------------------------------------------
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- keymaps for clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank
vim.keymap.set("n", "<leader>p", '"+p') -- paste
vim.keymap.set("x", "<leader>p", '"_dP') -- paste replace (keep register)

-----------------------------------------------------------
-- File Save & Quit
-----------------------------------------------------------
vim.g.mapleader = "\\" -- leader key

vim.keymap.set("n", "<leader>s", ":w<CR>") -- save
vim.keymap.set("n", "<leader>q", ":q<CR>") -- quit
vim.keymap.set("n", "<leader>sq", ":wq<CR>") -- save & quit
vim.keymap.set("n", "<leader>Q", ":q!<CR>") -- force quit

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------
-- half-page jumping (centered)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search navigation (centered)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-----------------------------------------------------------
-- Splits & Windows
-----------------------------------------------------------
vim.opt.splitright = true -- new vsplits go to the right
vim.opt.splitbelow = true -- new splits go below

-- splitting
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>") -- vertical
vim.keymap.set("n", "<leader>sh", ":split<CR>") -- horizontal

-- move between windows
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- resize splits
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-----------------------------------------------------------
-- Visual Mode Improvements
-----------------------------------------------------------
-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")

-- paste over selection without losing yank
vim.keymap.set("x", "<leader>p", '"_dP')

-----------------------------------------------------------
-- Delete Without Copying to Clipboard
-----------------------------------------------------------
-- 'd' will delete text without affecting registers/clipboard
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("x", "d", '"_d') -- visual mode

-----------------------------------------------------------
-- Misc / Fix noisy LSP messages
-----------------------------------------------------------
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

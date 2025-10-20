-- Leader key
vim.g.mapleader = "\\"

-----------------------------------------------------------
-- Tab Navigation
-----------------------------------------------------------
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Go to next tab", silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab", silent = true })
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "Open new tab", silent = true })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", { desc = "Close current tab", silent = true })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i, silent = true })
end

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })

-----------------------------------------------------------
-- Clipboard
-----------------------------------------------------------
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank
vim.keymap.set("n", "<leader>p", '"+p') -- paste
vim.keymap.set("x", "<leader>p", '"_dP') -- paste replace (keep register)

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- half-page down (centered)
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- half-page up (centered)
vim.keymap.set("n", "n", "nzzzv") -- search next (centered)
vim.keymap.set("n", "N", "Nzzzv") -- search prev (centered)
vim.keymap.set("n", "<C-a>", "gg<S-v>G") -- select all

-----------------------------------------------------------
-- Splits & Windows
-----------------------------------------------------------
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>") -- vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>") -- horizontal split
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-----------------------------------------------------------
-- Visual Mode Improvements
-----------------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")
vim.keymap.set("x", "<leader>p", '"_dP') -- paste over selection without losing yank

-----------------------------------------------------------
-- Delete Without Copying to Clipboard
-----------------------------------------------------------
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("x", "d", '"_d')

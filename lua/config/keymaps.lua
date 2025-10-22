local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true -- automatically add silent
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to Clipboard" }) -- yank into clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from Clipboard" }) -- paste from clipboard
map("x", "<leader>p", '"_dP', { desc = "Paste replace" }) -- paste replace (keep register)

-- Navigation
map("n", "<C-d>", "<C-d>zz") -- half-page down (centered)
map("n", "<C-u>", "<C-u>zz") -- half-page up (centered)
map("n", "n", "nzzzv") -- search next (centered)
map("n", "N", "Nzzzv") -- search prev (centered)
map("n", "<C-a>", "gg<S-v>G") -- select all

-- Splits & Windows
map("n", "sv", ":vsplit<CR>", { desc = "Vertical Split" }) -- vertical split
map("n", "ss", ":split<CR>", { desc = "Horizontal Split" }) -- horizontal split
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual Mode Improvements
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-1<CR>gv=gv")
map("x", "<leader>p", '"_dP') -- paste over selection without losing yank

-- Delete Without Copying to Clipboard
map("n", "x", '"_x') -- delete char without copying
map("n", "D", '"_D') -- delete to end of line without copying
map("v", "d", '"_d') -- delete selection without copying

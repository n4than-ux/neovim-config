local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = true        -- automatically add silent
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader key
vim.g.mapleader = "\\"

-- Tab Navigation
map("n", "<leader>tn", ":tabnext<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab" })
map("n", "<leader>t", ":tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tq", ":tabclose<CR>", { desc = "Close current tab" })
for i = 1, 9 do
  map("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
end

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y') -- yank into clipboard
map("n", "<leader>p", '"+p') -- paste from clipboard
map("x", "<leader>p", '"_dP') -- paste replace (keep register)

-- Navigation
map("n", "<C-d>", "<C-d>zz") -- half-page down (centered)
map("n", "<C-u>", "<C-u>zz") -- half-page up (centered)
map("n", "n", "nzzzv") -- search next (centered)
map("n", "N", "Nzzzv") -- search prev (centered)
map("n", "<C-a>", "gg<S-v>G") -- select all

-- Splits & Windows
map("n", "<leader>sv", ":vsplit<CR>") -- vertical split
map("n", "<leader>sh", ":split<CR>") -- horizontal split
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
map("n", "d", '"_d')
map("x", "d", '"_d')

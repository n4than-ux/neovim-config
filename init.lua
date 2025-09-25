local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
print("Loaded successfully!")
vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true

require("vim-options")
-- import plugins
require("lazy").setup("plugins")

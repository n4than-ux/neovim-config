-- all vim helper functions here

vim.keymap.set("n", "<leader>ce", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics == 0 then
		vim.notify("No diagnostic at cursor", vim.log.levels.INFO)
		return
	end

	local messages = {}
	for _, diag in ipairs(diagnostics) do
		table.insert(messages, diag.message)
	end

	local message = table.concat(messages, "\n")
	vim.fn.setreg("+", message)
	vim.notify("Copied diagnostic:\n" .. message, vim.log.levels.INFO)
end, { noremap = true, silent = true })

-- go to errors in a file :/
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next) -- next err
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev) -- previous err
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- copy current file path (absolute) into clipboard
vim.keymap.set("n", "<leader>cp", function()
	local filepath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filepath) -- Copy to Neovim clipboard
	vim.fn.system("echo '" .. filepath .. "' | pbcopy") -- Copy to macOS clipboard
	print("Copied: " .. filepath)
end, { desc = "Copy absolute path to clipboard" })

-- open the current file in browser
vim.keymap.set("n", "<leader>ob", function()
	local file_path = vim.fn.expand("%:p") -- get current file path
	if file_path == "" then
		print("No file to open")
		return
	end

	-- Check if Brave is installed
	local brave_path = vim.fn.system("which brave-browser"):gsub("\n", "")
	if brave_path == "" then
		print("Brave browser not found")
		return
	end

	-- Open file in Brave
	os.execute("brave-browser " .. file_path .. " &")
end, { desc = "Open current file in Brave" })

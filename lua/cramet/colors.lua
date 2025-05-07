-- List of themes to toggle between
local themes = { "catppuccin-latte", "catppuccin-mocha" }
local current = 1

-- Apply a theme at startup based on terminal color support
if vim.env.TERM == "xterm-256color" then
	vim.cmd("colorscheme default")
else
	local available = vim.fn.getcompletion(themes[current], "color")
	if vim.tbl_contains(available, themes[current]) then
		vim.cmd.colorscheme(themes[current])
	end
end

-- Keybind to toggle between themes
vim.keymap.set("n", "<leader>tt", function()
	current = current % #themes + 1
	vim.cmd.colorscheme(themes[current])
	print("Colorscheme: " .. themes[current])
end, { desc = "[T]oggle [T]hemes" })

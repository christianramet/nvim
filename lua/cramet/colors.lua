-- List of themes to toggle between
local themes = { "catppuccin-latte", "catppuccin-mocha" }
local current = 1

-- Apply a theme at startup based on terminal color support
if vim.env.TERM_PROGRAM == "iTerm.app" then
  local theme = themes[1]
  -- Check if the theme is available
  if vim.fn.getcompletion(theme, "color")[1] == theme then
    vim.cmd.colorscheme(theme)
  end
end

-- Keybind to toggle between themes
vim.keymap.set("n", "<leader>tt", function()
	current = current % #themes + 1
	vim.cmd.colorscheme(themes[current])
	print("Colorscheme: " .. themes[current])
end, { desc = "[T]oggle [T]hemes" })

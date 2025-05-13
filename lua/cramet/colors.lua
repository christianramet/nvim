-- List of themes to toggle between
local themes = { "catppuccin-latte", "catppuccin-mocha" }
local current = 1
local theme = themes[1]

-- Function to check if a theme exists
local function theme_exists(name)
  local all_themes = vim.fn.getcompletion("", "color")
  for _, t in ipairs(all_themes) do
    if t == name then
      return true
    end
  end
  return false
end

-- Check if the theme is available and load it
if theme_exists(theme) then
  vim.cmd.colorscheme(theme)
end

-- Keybind to toggle between themes
vim.keymap.set("n", "<leader>tt", function()
	current = current % #themes + 1
	vim.cmd.colorscheme(themes[current])
	print("Colorscheme: " .. themes[current])
end, { desc = "[T]oggle [T]hemes" })

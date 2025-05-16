-- List of themes to toggle between
local themes = { "catppuccin-latte", "catppuccin-mocha" }
local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

-- Check if a theme exists
local function theme_exists(name)
  for _, t in ipairs(vim.fn.getcompletion("", "color")) do
    if t == name then return true end
  end
  return false
end

-- Read the saved theme from file
local function read_saved_theme()
  local file = io.open(theme_file, "r")
  if not file then return nil end
  local saved = file:read("*l")
  file:close()
  return saved
end

-- Write the theme to file
local function write_theme(theme)
  local file = io.open(theme_file, "w")
  if file then
    file:write(theme)
    file:close()
  end
end

-- Apply a theme, optionally given as argument
local function apply_theme(theme)
  local name = theme

  if not name then
    local saved = read_saved_theme()
    if saved and theme_exists(saved) then
      name = saved
    else
      name = themes[1] -- fallback to first theme
    end
  end

  if theme_exists(name) then
    vim.cmd.colorscheme(name)
    write_theme(name)
  end
end

-- At startup
apply_theme()

-- Keybind to toggle between themes
vim.keymap.set("n", "<leader>tt", function()
  local saved = read_saved_theme()
  local index = 1

  -- Find current index
  if saved then
    for i, t in ipairs(themes) do
      if t == saved then
        index = i
        break
      end
    end
  end

  -- Get next theme
  local next = themes[(index % #themes) + 1]
  apply_theme(next)
end, { desc = "[T]oggle [T]hemes" })


return {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  priority = 1000,
  enabled = true,
  config = function()
  require("catppuccin").setup({})

  -- Set default theme
  vim.cmd.colorscheme("catppuccin-latte")

  -- List of themes to toggle between
  local themes = { "catppuccin-latte", "catppuccin-mocha" }
  local current = 1

  -- Keybinding to toggle between themes
  vim.keymap.set("n", "<leader>tt", function()
	  current = current % #themes + 1
	  vim.cmd.colorscheme(themes[current])
	  print("Colorscheme: " .. themes[current])
  end, { desc = "[T]oggle [T]hemes" })

end,
}

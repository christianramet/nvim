return{
  'folke/which-key.nvim',
  event = 'VimEnter',
  enable = true,
  opts = {
    delay = 200, -- independent of vim.opt.timeoutlen
    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
    },
  },
}

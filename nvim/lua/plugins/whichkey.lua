return {
  'folke/which-key.nvim',
  lazy = false,
  opts = {
    win = {
      border = 'rounded',
      padding = { 1, 0, 1, 0 },
    },
  },
  keys = {
    { '<leader>c', group = 'code' },
    { '<leader>d', group = 'dap' },
    { '<leader>p', group = 'persistence' },
    { '<leader>s', group = 'search' },
    { '<leader>t', group = 'tests' },
    { '<leader>x', group = 'trouble' },
    { '<leader>h', group = 'rest' },
  },
}

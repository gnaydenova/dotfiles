return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    win = {
      border = 'rounded',
      padding = { 1, 0, 1, 0 },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    local mappings = {
      { '<leader>c', group = 'code' },
      { '<leader>d', group = 'dap' },
      { '<leader>p', group = 'persistence' },
      { '<leader>s', group = 'search' },
      { '<leader>t', group = 'tests' },
      { '<leader>x', group = 'trouble' },
    }
    wk.add(mappings)
  end,
}

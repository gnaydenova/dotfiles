return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    win = {
      padding = { 1, 0, 1, 0 },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    local mappings = {
      { '<leader>a', group = 'ai' },
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

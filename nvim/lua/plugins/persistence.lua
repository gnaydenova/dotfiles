return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  config = true,
  keys = {
    {
      '<leader>pl',
      function()
        require('persistence').load { last = true }
      end,
      desc = 'Restore last session',
    },
    {
      '<leader>pr',
      function()
        require('persistence').load()
      end,
      desc = 'Restore current dir session',
    },
  },
}

return {
  'rest-nvim/rest.nvim',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = true,
  ft = { 'http' },
  keys = {
    { '<leader>hr', '<Plug>RestNvim<CR>', desc = 'Run request' },
    { '<leader>hp', '<Plug>RestNvimPreview<CR>', desc = 'Preview request' },
    { '<leader>hl', '<Plug>RestNvimLast<CR>', desc = 'Rerun last request' },
  },
}

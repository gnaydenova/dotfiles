return {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-sleuth' },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'numToStr/Navigator.nvim',
    config = true,
    keys = {
      { '<C-h>', '<cmd>NavigatorLeft<CR>', desc = 'Navigate Left' },
      { '<C-j>', '<cmd>NavigatorDown<CR>', desc = 'Navigate Down' },
      { '<C-k>', '<cmd>NavigatorUp<CR>', desc = 'Navigate Up' },
      { '<C-l>', '<cmd>NavigatorRight<CR>', desc = 'Navigate Right' },
    },
  },
}

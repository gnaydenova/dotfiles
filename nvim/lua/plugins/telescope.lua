return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    require('telescope').load_extension('ui-select')

    local telescope_builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>so', telescope_builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>se', telescope_builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>ss', function()
      telescope_builtin.grep_string { search = '' }
    end, { desc = 'Search' })
  end,
}

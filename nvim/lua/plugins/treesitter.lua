return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
  },
  config = function()
    local treesitter = require 'nvim-treesitter.configs'

    vim.cmd [[set foldmethod=expr]]
    vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
    vim.cmd [[set foldlevel=10]]

    treesitter.setup {
      ensure_installed = 'all',
      sync_install = false,
      auto_install = true,
      ignore_install = {'ipkg'},
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
          },
        },
      },
      refactor = {
        highlight_definitions = {
          enable = true,
        },
      },
    }
  end,
}

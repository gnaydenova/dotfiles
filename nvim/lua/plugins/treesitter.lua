return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'HiPhish/nvim-ts-rainbow2',
  },
  config = function()
    local treesitter = require 'nvim-treesitter.configs'

    vim.cmd [[set foldmethod=expr]]
    vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
    vim.cmd [[set foldlevel=10]]

    treesitter.setup {
      ensure_installed = 'all',
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
      rainbow = {
        enable = false,
        query = 'rainbow-parens',
        strategy = require('ts-rainbow').strategy.global,
      },
    }
  end,
}

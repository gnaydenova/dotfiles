return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-go',
    'haydenmeade/neotest-jest',
  },
  lazy = true,
  keys = {
    {
      '<leader>tr',
      function()
        local neotest = require 'neotest'
        neotest.output_panel.open()
        neotest.run.run()
      end,
      desc = 'Run nearest test',
    },
    {
      '<leader>tt',
      function()
        local neotest = require 'neotest'
        neotest.output_panel.open()
        neotest.run.run_last()
      end,
      desc = 'Re-run last',
    },
    {
      '<leader>tf',
      function()
        local neotest = require 'neotest'
        neotest.output_panel.open()
        neotest.run.run(vim.fn.expand '%')
      end,
      desc = 'Run current file',
    },
    {
      '<leader>ta',
      function()
        local neotest = require 'neotest'
        neotest.output_panel.open()
        neotest.run.run(vim.fn.getcwd())
      end,
      desc = 'Run all tests',
    },
    {
      '<leader>to',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle tests output panel',
    },
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    require('neotest').setup {
      -- your neotest config here
      adapters = {
        require 'neotest-go',
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}

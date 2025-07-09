return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'leoluz/nvim-dap-go',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
  },
  lazy = true,
  keys = {
    {'<F5>', ":lua require'dap'.continue()<CR>"},
    {'<F3>', ":lua require'dap'.step_over()<CR>"},
    {'<F2>', ":lua require'dap'.step_into()<CR>"},
    {'<F6>', ":lua require'dap'.step_out()<CR>"},
    {'<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", desc = 'Toggle breakpoint'},
    {'<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = 'Set breakpoint'},
    {'<leader>dr', ":lua require'dap'.repl.open()<CR>", desc = 'Open REPL'},
    {'<leader>dt', ":lua require'dap-go'.debug_test()<CR>", desc = '[Go] Debug test'},
  },
  config = function()
    require('nvim-dap-virtual-text').setup()
    require('dap-go').setup()
    require('dapui').setup {
      icons = { expanded = '', collapsed = '' },
      expand_lines = false,
      layouts = {
        {
          elements = {
            {
              id = 'watches',
              size = 0.25,
            },
            {
              id = 'scopes',
              size = 0.25,
            },
            {
              id = 'breakpoints',
              size = 0.25,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
          },
          position = 'right',
          size = 50,
        },
        {
          elements = { {
            id = 'repl',
            size = 1,
          } },
          position = 'bottom',
          size = 10,
        },
      },
    }

    local sign = vim.fn.sign_define

    sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })

    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
  end,
}

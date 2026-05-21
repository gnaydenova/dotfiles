return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    lualine.setup {
      options = {
        theme = 'catppuccin-macchiato',
        disabled_filetypes = { 'neo-tree' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch' }, { 'diff' }, { 'diagnostics', sources = { 'nvim_diagnostic' } } },
        lualine_c = { { 'filename', path = 1, newfile_status = true } },
        lualine_x = {
          -- Sidekick: Copilot LSP status
          {
            function()
              return ' '
            end,
            color = function()
              local status = require('sidekick.status').get()
              if status then
                return status.kind == 'Error' and 'DiagnosticError' or status.busy and 'DiagnosticWarn' or 'Special'
              end
            end,
            cond = function()
              return require('sidekick.status').get() ~= nil
            end,
          },
          -- Sidekick: active CLI session indicator
          {
            function()
              local s = require('sidekick.status').cli()
              return ' ' .. (#s > 1 and #s or '')
            end,
            cond = function()
              return #require('sidekick.status').cli() > 0
            end,
            color = 'Special',
          },
          'encoding', 'fileformat', 'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}

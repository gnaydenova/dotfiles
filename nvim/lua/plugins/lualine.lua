return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    lualine.setup {
      options = {
        theme = 'catppuccin',
        disabled_filetypes = { 'neo-tree' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch' }, { 'diff' }, { 'diagnostics', sources = { 'nvim_diagnostic' } } },
        lualine_c = { { 'filename', path = 1, newfile_status = true } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}

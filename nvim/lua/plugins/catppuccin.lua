return {
  'catppuccin/nvim',
  enabled = true,
  lazy = false,
  name = 'catppuccin',
  opts = {
    flavour = 'macchiato',
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      neotest = true,
      which_key = true,
      dap = {
        enabled = true,
        enable_ui = true,
      },
      ts_rainbow2 = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}

return {
  'folke/sidekick.nvim',
  lazy = false,
  opts = {
    cli = {
      picker = 'telescope',
      mux = {
        backend = 'tmux',
        enabled = true,
      },
      -- opencode is pre-configured, just ensure it's available
      tools = {
        opencode = {},
      },
    },
  },
  keys = {
    -- opencode CLI
    {
      '<leader>ao',
      function() require('sidekick.cli').toggle { name = 'opencode', focus = true } end,
      desc = 'Toggle opencode',
    },
    -- Generic CLI controls
    {
      '<c-.>',
      function() require('sidekick.cli').focus() end,
      mode = { 'n', 't', 'i', 'x' },
      desc = 'Sidekick Focus',
    },
    {
      '<leader>aa',
      function() require('sidekick.cli').toggle() end,
      desc = 'Sidekick Toggle CLI',
    },
    {
      '<leader>as',
      function() require('sidekick.cli').select() end,
      desc = 'Sidekick Select CLI',
    },
    {
      '<leader>ap',
      function() require('sidekick.cli').prompt() end,
      mode = { 'n', 'x' },
      desc = 'Sidekick Prompt',
    },
    -- Context sending
    {
      '<leader>at',
      function() require('sidekick.cli').send { msg = '{this}' } end,
      mode = { 'n', 'x' },
      desc = 'Send This',
    },
    {
      '<leader>af',
      function() require('sidekick.cli').send { msg = '{file}' } end,
      desc = 'Send File',
    },
    {
      '<leader>av',
      function() require('sidekick.cli').send { msg = '{selection}' } end,
      mode = { 'x' },
      desc = 'Send Visual Selection',
    },
  },
}

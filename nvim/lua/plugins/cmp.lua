return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
  },
  version = '1.*',
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = 'default',
      -- Jump through snippet placeholders
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
      -- Integrate with sidekick NES and Copilot inline completions
      ['<Tab>'] = {
        'snippet_forward',
        function()
          return vim.lsp.inline_completion.get()
        end,
        function()
          return require('sidekick').nes_jump_or_apply()
        end,
        'fallback',
      },
    },
    appearance = {
      -- Use Neovim's built-in highlight groups
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true },
  },
}

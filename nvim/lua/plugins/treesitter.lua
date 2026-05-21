-- nvim-treesitter is used solely as a parser installer.
-- Highlighting, indent, and folding are handled by Neovim natively (0.10+).
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').setup()

    -- Parsers to keep installed. Add more as needed with :TSInstall <lang>
    require('nvim-treesitter.install').install {
      'bash', 'c', 'css', 'diff', 'go', 'gomod', 'gosum', 'gowork',
      'html', 'javascript', 'json', 'lua', 'luadoc', 'markdown',
      'markdown_inline', 'python', 'query', 'regex', 'toml', 'tsx',
      'typescript', 'vim', 'vimdoc', 'yaml',
    }
  end,
}

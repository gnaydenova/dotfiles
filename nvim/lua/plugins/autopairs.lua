return {
  'windwp/nvim-autopairs',
  config = function()
    local autopairs = require 'nvim-autopairs'
    ---@diagnostic disable: missing-parameter
    local rule = require 'nvim-autopairs.rule'

    autopairs.setup {
      map_c_w = true,
      map_c_h = true,
      enable_check_bracket_line = false,
    }

    autopairs.add_rules {
      rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
      end),
      rule('( ', ' )')
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match '.%)' ~= nil
        end)
        :use_key ')',
      rule('{ ', ' }')
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match '.%}' ~= nil
        end)
        :use_key '}',
      rule('[ ', ' ]')
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match '.%]' ~= nil
        end)
        :use_key ']',
    }
  end,
}

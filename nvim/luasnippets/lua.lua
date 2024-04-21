local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local require_var = function(args, _)
  local text = (args[1][1] or ''):gsub('-', '_')
  local split = vim.split(text, '.', { plain = true })

  local options = { i(nil) }
  for len = 0, #split - 1 do
    table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), '_')))
  end

  if #options == 1 then
    return sn(nil, {
      c(1, {
        i(nil),
      }),
    })
  end

  return sn(nil, {
    c(1, options),
  })
end

return {
  s(
    { trig = 'prc', name = 'Protected require call.' },
    fmt(
      [[
        local has_{}, {} = pcall(require, "{}")

        if not has_{} then
            vim.notify("{} is missing", vim.log.levels.WARN)
            return
        end
        ]],
      {
        rep(2),
        d(2, require_var, { 1 }),
        i(1),
        rep(2),
        rep(1),
      }
    )
  ),
}

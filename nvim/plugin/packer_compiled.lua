-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gnaydenova/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gnaydenova/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gnaydenova/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gnaydenova/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gnaydenova/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\ny\0\0\3\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\1\0\1\fflavour\14macchiato\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÝ\4\0\0\6\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3B\1\2\1K\0\1\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\28current_line_blame_opts\1\0\4\14virt_text\2\ndelay\3È\1\22ignore_whitespace\2\18virt_text_pos\beol\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\2\vbuffer\2\fnoremap\2\nsigns\1\0\2\23current_line_blame\2\18sign_priority\3\5\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\bâ”‚\badd\1\0\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1À\6n\16toggle_markŒ\6\1\0\t\0009\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\3)\4\1\0=\4\6\0036\3\4\0009\3\5\3)\4\1\0=\4\a\0036\3\0\0'\5\b\0B\3\2\0029\3\t\0035\5\n\0005\6\f\0009\a\v\0=\a\r\0069\a\v\0=\a\14\0069\a\15\0=\a\16\0069\a\17\0=\a\18\0069\a\19\0=\a\20\0069\a\21\0=\a\22\0069\a\21\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\0069\a\"\0=\a#\0069\a$\0=\a%\0069\a&\0=\a'\0063\a(\0=\a)\0069\a*\2=\a+\0069\a,\2=\a-\0069\a.\2=\a/\6=\0060\5B\3\2\0016\3\4\0009\0031\0039\0032\3'\0053\0'\0064\0'\a5\0005\b6\0B\3\5\0016\3\4\0009\0031\0039\0032\3'\0053\0'\6\23\0'\a7\0005\b8\0B\3\5\0012\0\0€K\0\1\0\1\0\1\tdesc\26Open parent directory\21<CMD>e %:p:h<CR>\1\0\1\tdesc#Open current working directory\17<CMD>e .<CR>\aÂ§\6n\bset\vkeymap\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6-\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\6l\t<CR>\1\0\0\tedit\1\0\3\16hide_cursor\1\20devicons_enable\2\22show_hidden_files\2\nsetup\blir\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\15catppuccin\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charÙ\3\1\0\t\0\26\1I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0B\2\2\0019\2\5\0004\4\5\0\18\5\1\0'\a\6\0'\b\6\0B\5\3\2\18\a\5\0009\5\a\0053\b\b\0B\5\3\2>\5\1\4\18\5\1\0'\a\t\0'\b\n\0B\5\3\2\18\a\5\0009\5\a\0053\b\v\0B\5\3\2\18\a\5\0009\5\f\0053\b\r\0B\5\3\2\18\a\5\0009\5\14\5'\b\15\0B\5\3\2>\5\2\4\18\5\1\0'\a\16\0'\b\17\0B\5\3\2\18\a\5\0009\5\a\0053\b\18\0B\5\3\2\18\a\5\0009\5\f\0053\b\19\0B\5\3\2\18\a\5\0009\5\14\5'\b\20\0B\5\3\2>\5\3\4\18\5\1\0'\a\21\0'\b\22\0B\5\3\2\18\a\5\0009\5\a\0053\b\23\0B\5\3\2\18\a\5\0009\5\f\0053\b\24\0B\5\3\2\18\a\5\0009\5\14\5'\b\25\0B\5\3\0?\5\0\0B\2\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\1\0\3\fmap_c_h\2\fmap_c_w\2\30enable_check_bracket_line\1\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\t€€À™\4\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleî\a\1\0\v\0008\0p6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\a\2B\2\1\0016\2\b\0006\4\0\0'\5\t\0B\2\3\2\14\0\2\0X\2\r€9\2\n\0\18\4\2\0009\2\v\2'\5\f\0006\6\0\0'\b\t\0B\6\2\0029\6\r\0065\b\15\0005\t\14\0=\t\16\bB\6\2\0A\2\2\0013\2\17\0009\3\18\0005\5\22\0005\6\20\0003\a\19\0=\a\21\6=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\0055\6$\0004\a\b\0009\b\3\0009\b\28\b9\b\29\b>\b\1\a9\b\3\0009\b\28\b9\b\30\b>\b\2\a9\b\3\0009\b\28\b9\b\31\b>\b\3\a9\b\3\0009\b\28\b9\b \b>\b\4\a9\b\3\0009\b\28\b9\b!\b>\b\5\a9\b\3\0009\b\28\b9\b\"\b>\b\6\a9\b\3\0009\b\28\b9\b#\b>\b\a\a=\a%\6=\6&\0059\6\3\0009\6'\0064\b\6\0005\t(\0>\t\1\b5\t)\0>\t\2\b5\t*\0>\t\3\b5\t+\0>\t\4\b5\t,\0>\t\5\bB\6\2\2=\6'\0055\0060\0009\a-\0003\t.\0005\n/\0B\a\3\2=\a1\0069\a-\0003\t2\0005\n3\0B\a\3\2=\a4\0069\a-\0009\a5\a5\t6\0B\a\2\2=\a7\6=\6-\5B\3\2\0012\0\0€K\0\1\0\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\rsortings\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nscore\nexact\voffset\fcompare\17experimental\1\0\2\16native_menu\1\15ghost_text\2\tview\1\0\2\20selection_order\16near_cursor\fentries\vcustom\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\rmap_char\1\0\0\1\0\1\ttext\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\npcall\14lazy_load luasnip.loaders.from_vscode\1\0\1\fhistory\2\15set_config\vconfig\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÅ\2\0\0\5\0\17\0\0276\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\0025\3\14\0005\4\r\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\rrefactor\26highlight_definitions\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\21set foldlevel=10,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gnaydenova/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\15catppuccin\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1À\6n\16toggle_markŒ\6\1\0\t\0009\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\3)\4\1\0=\4\6\0036\3\4\0009\3\5\3)\4\1\0=\4\a\0036\3\0\0'\5\b\0B\3\2\0029\3\t\0035\5\n\0005\6\f\0009\a\v\0=\a\r\0069\a\v\0=\a\14\0069\a\15\0=\a\16\0069\a\17\0=\a\18\0069\a\19\0=\a\20\0069\a\21\0=\a\22\0069\a\21\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\0069\a\"\0=\a#\0069\a$\0=\a%\0069\a&\0=\a'\0063\a(\0=\a)\0069\a*\2=\a+\0069\a,\2=\a-\0069\a.\2=\a/\6=\0060\5B\3\2\0016\3\4\0009\0031\0039\0032\3'\0053\0'\0064\0'\a5\0005\b6\0B\3\5\0016\3\4\0009\0031\0039\0032\3'\0053\0'\6\23\0'\a7\0005\b8\0B\3\5\0012\0\0€K\0\1\0\1\0\1\tdesc\26Open parent directory\21<CMD>e %:p:h<CR>\1\0\1\tdesc#Open current working directory\17<CMD>e .<CR>\aÂ§\6n\bset\vkeymap\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6-\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\6l\t<CR>\1\0\0\tedit\1\0\3\16hide_cursor\1\20devicons_enable\2\22show_hidden_files\2\nsetup\blir\23loaded_netrwPlugin\17loaded_netrw\6g\bvim\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÅ\2\0\0\5\0\17\0\0276\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\0025\3\14\0005\4\r\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\rrefactor\26highlight_definitions\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\21set foldlevel=10,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\bcmd\bvim\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleî\a\1\0\v\0008\0p6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\a\2B\2\1\0016\2\b\0006\4\0\0'\5\t\0B\2\3\2\14\0\2\0X\2\r€9\2\n\0\18\4\2\0009\2\v\2'\5\f\0006\6\0\0'\b\t\0B\6\2\0029\6\r\0065\b\15\0005\t\14\0=\t\16\bB\6\2\0A\2\2\0013\2\17\0009\3\18\0005\5\22\0005\6\20\0003\a\19\0=\a\21\6=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\0055\6$\0004\a\b\0009\b\3\0009\b\28\b9\b\29\b>\b\1\a9\b\3\0009\b\28\b9\b\30\b>\b\2\a9\b\3\0009\b\28\b9\b\31\b>\b\3\a9\b\3\0009\b\28\b9\b \b>\b\4\a9\b\3\0009\b\28\b9\b!\b>\b\5\a9\b\3\0009\b\28\b9\b\"\b>\b\6\a9\b\3\0009\b\28\b9\b#\b>\b\a\a=\a%\6=\6&\0059\6\3\0009\6'\0064\b\6\0005\t(\0>\t\1\b5\t)\0>\t\2\b5\t*\0>\t\3\b5\t+\0>\t\4\b5\t,\0>\t\5\bB\6\2\2=\6'\0055\0060\0009\a-\0003\t.\0005\n/\0B\a\3\2=\a1\0069\a-\0003\t2\0005\n3\0B\a\3\2=\a4\0069\a-\0009\a5\a5\t6\0B\a\2\2=\a7\6=\6-\5B\3\2\0012\0\0€K\0\1\0\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\rsortings\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nscore\nexact\voffset\fcompare\17experimental\1\0\2\16native_menu\1\15ghost_text\2\tview\1\0\2\20selection_order\16near_cursor\fentries\vcustom\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\rmap_char\1\0\0\1\0\1\ttext\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\npcall\14lazy_load luasnip.loaders.from_vscode\1\0\1\fhistory\2\15set_config\vconfig\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÝ\4\0\0\6\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3B\1\2\1K\0\1\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\28current_line_blame_opts\1\0\4\14virt_text\2\ndelay\3È\1\22ignore_whitespace\2\18virt_text_pos\beol\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\2\vbuffer\2\fnoremap\2\nsigns\1\0\2\23current_line_blame\2\18sign_priority\3\5\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\bâ”‚\badd\1\0\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\ny\0\0\3\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\1\0\1\fflavour\14macchiato\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charÙ\3\1\0\t\0\26\1I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0B\2\2\0019\2\5\0004\4\5\0\18\5\1\0'\a\6\0'\b\6\0B\5\3\2\18\a\5\0009\5\a\0053\b\b\0B\5\3\2>\5\1\4\18\5\1\0'\a\t\0'\b\n\0B\5\3\2\18\a\5\0009\5\a\0053\b\v\0B\5\3\2\18\a\5\0009\5\f\0053\b\r\0B\5\3\2\18\a\5\0009\5\14\5'\b\15\0B\5\3\2>\5\2\4\18\5\1\0'\a\16\0'\b\17\0B\5\3\2\18\a\5\0009\5\a\0053\b\18\0B\5\3\2\18\a\5\0009\5\f\0053\b\19\0B\5\3\2\18\a\5\0009\5\14\5'\b\20\0B\5\3\2>\5\3\4\18\5\1\0'\a\21\0'\b\22\0B\5\3\2\18\a\5\0009\5\a\0053\b\23\0B\5\3\2\18\a\5\0009\5\f\0053\b\24\0B\5\3\2\18\a\5\0009\5\14\5'\b\25\0B\5\3\0?\5\0\0B\2\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\1\0\3\fmap_c_h\2\fmap_c_w\2\30enable_check_bracket_line\1\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\t€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

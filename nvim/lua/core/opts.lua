vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable unused providers to suppress checkhealth warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = vim.api.nvim_replace_termcodes('<space>', true, true, true)

vim.o.shiftwidth = 4
vim.o.scrolloff = 10
vim.o.number = true
vim.o.tabstop = 4
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.undofile = true
vim.o.updatetime = 700
vim.o.mouse = 'a'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.timeoutlen = 200
vim.o.clipboard = 'unnamedplus'
vim.o.splitright = true

-- Float window borders (hover, signature help, diagnostics)
vim.o.winborder = 'rounded'

-- Treesitter (built-in since Neovim 0.10, no plugin needed)
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 10

-- Enable treesitter highlight and indent for all buffers
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
  callback = function(ev)
    local ok = pcall(vim.treesitter.start, ev.buf)
    if ok then
      vim.bo[ev.buf].indentexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})

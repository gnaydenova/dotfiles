return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    -- LSP progress spinner
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- Extend default capabilities with blink.cmp completions
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Apply capabilities and enable all servers configured in lsp/*.lua
    vim.lsp.config('*', { capabilities = capabilities })

    -- Enable servers (configured via lsp/<name>.lua files)
    vim.lsp.enable { 'gopls', 'lua_ls', 'ts_ls', 'copilot' }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- Highlight word under cursor
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup('lsp-highlight-' .. event.buf, { clear = true })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = group,
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = group,
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach-' .. event.buf, { clear = true }),
            buffer = event.buf,
            callback = function()
              vim.api.nvim_del_augroup_by_name('lsp-highlight-' .. event.buf)
            end,
          })
        end

        -- Toggle inlay hints
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end

        -- Copilot inline completions
        if client and client:supports_method('textDocument/inlineCompletion') then
          vim.lsp.inline_completion.enable(true, { bufnr = event.buf })
        end
      end,
    })
  end,
}

return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },       -- Required
		{ 'williamboman/mason.nvim' },     -- Optional
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },   -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'hrsh7th/cmp-buffer' }, -- Optional
		{ 'hrsh7th/cmp-path' },   -- Optional
		{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
		{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },       -- Required
		{ 'rafamadriz/friendly-snippets' }, -- Optional
	},
	config = function()
		local lsp = require('lsp-zero').preset({
			name = 'recommended',
			set_lsp_keymaps = false,
			manage_nvim_cmp = true,
			suggest_lsp_servers = true,
		})
		lsp.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr }
			local bind = vim.keymap.set

			bind('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			bind('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			bind('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			bind('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			bind('n', '<leader>f', '<cmd>LspZeroFormat<cr>', opts)
		end)

		lsp.nvim_workspace()
		lsp.setup()
	end
}

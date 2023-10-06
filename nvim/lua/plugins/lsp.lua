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

		-- Formatting
		{ 'onsails/lspkind.nvim' },
		{ 'jose-elias-alvarez/null-ls.nvim' },
		{ 'jay-babu/mason-null-ls.nvim' }
	},
	config = function()
		local lsp = require('lsp-zero').preset({
			name = 'recommended',
			set_lsp_keymaps = false,
			manage_nvim_cmp = false,
			suggest_lsp_servers = true,
		})
		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr }
			local bind = vim.keymap.set

			if client.supports_method("textDocument/inlayHint") then
				vim.lsp.inlay_hint(bufnr, true)
			end

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

		local lspkind = require('lspkind')
		local cmp = require('cmp')
		local cmp_config = lsp.defaults.cmp_config({
			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
					menu = {
						path = "[Path]",
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						luasnip = "[Snippet]",
						cmp_tabnine = "[Tabnine]",
					},
				}),
			},
			window = {
				completion = cmp.config.window.bordered({ border = "rounded" }),
			},
			sources = {
				{ name = 'path' },
				{ name = 'nvim_lsp' },
				{ name = 'buffer',     keyword_length = 3 },
				{ name = 'luasnip',    keyword_length = 2 },
				{ name = 'cmp_tabnine' },
			}
		})

		cmp.setup(cmp_config)

		lsp.nvim_workspace()

		lsp.configure('lua_ls', {
			settings = {
				Lua = {
					hint = {
						enable = true
					}
				}
			}
		})

		lsp.configure('gopls', {
			settings = {
				gopls = {
					hints = {
						-- assignVariableTypes = true,
						-- compositeLiteralFields = true,
						-- compositeLiteralTypes = true,
						-- functionTypeParameters = true,
						parameterNames = true,
						-- rangeVariableTypes = true,
					}
				}
			}
		})

		lsp.setup()

		require("mason-null-ls").setup({
			ensure_installed = { "stylua" },
			automatic_setup = true,
		})
		require("null-ls").setup()
	end
}

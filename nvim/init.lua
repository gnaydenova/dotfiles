require('core.opts')

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'ful1e5/onedark.nvim',
		config = function()
			require('onedark').setup {
				overrides = function(colors)
					return {
						Visual = { style = "reverse" }
					}
				end
			}
			vim.cmd[[colo onedark]]
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'onedark-nvim',
				}
			}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/playground"
		},
		config = function()
			vim.cmd [[set foldmethod=expr]]
			vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
			vim.cmd [[set foldlevel=10]]
			require'nvim-treesitter.configs'.setup {
				ensure_installed = "maintained",
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
				refactor = {
					highlight_definitions = {
						enable = true
					}
				}
			}
		end
	}
	use 'tpope/vim-surround'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	use {
		'neovim/nvim-lspconfig',
		requires = {'williamboman/nvim-lsp-installer'},
		config = function()
			require('plugins.lsp')
		end
	}
	use {
		'folke/lua-dev.nvim'
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require'cmp'
			local luasnip = require("luasnip")

			luasnip.config.set_config({ history = true })

			require("luasnip.loaders.from_vscode").lazy_load()

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			cmp.setup{
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end
				},
				sources = cmp.config.sources({
					{name = 'nvim_lsp'},
					{name = "luasnip"},
					{name = 'path'},
					{name = 'buffer'}
				}),
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}
			}
		end
	}
end)

require('core.opts')

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { "catppuccin/nvim", as = "catppuccin", config = function()
		require("catppuccin").setup({
			flavour = "macchiato"
		})
		vim.cmd.colorscheme "catppuccin"
	end
	}
	use {
		'ful1e5/onedark.nvim',
		disable = true,
		config = function()
			require('onedark').setup {
				overrides = function()
					return {
						Visual = { style = "reverse" }
					}
				end
			}
			vim.cmd [[colo onedark]]
		end
	}
	use "tpope/vim-fugitive"
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require "gitsigns"

			gitsigns.setup {
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				keymaps = {
					noremap = true,
					buffer = true,
					["n ]c"] = {
						expr = true,
						"&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
					},
					["n [c"] = {
						expr = true,
						"&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
					},
				},
				sign_priority = 5,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 200,
					ignore_whitespace = true,
				},
				current_line_blame_formatter_opts = {
					relative_time = true,
				},
			}
		end,
		requires = { "nvim-lua/plenary.nvim" },
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'catppuccin',
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
			require 'nvim-treesitter.configs'.setup {
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
	use {
		"windwp/nvim-autopairs",
		disable = false,
		config = function()
			---@diagnostic disable: missing-parameter
			local npairs = require "nvim-autopairs"
			local Rule = require "nvim-autopairs.rule"

			npairs.setup {
				map_c_w = true,
				map_c_h = true,
				enable_check_bracket_line = false,
			}

			npairs.add_rules {
				Rule(" ", " "):with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ "()", "[]", "{}" }, pair)
				end),
				Rule("( ", " )")
					:with_pair(function()
						return false
					end)
					:with_move(function(opts)
						return opts.prev_char:match ".%)" ~= nil
					end)
					:use_key ")",
				Rule("{ ", " }")
					:with_pair(function()
						return false
					end)
					:with_move(function(opts)
						return opts.prev_char:match ".%}" ~= nil
					end)
					:use_key "}",
				Rule("[ ", " ]")
					:with_pair(function()
						return false
					end)
					:with_move(function(opts)
						return opts.prev_char:match ".%]" ~= nil
					end)
					:use_key "]",
			}
		end,
	}

	use 'tpope/vim-surround'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require('core.mappings').telescope()
		end
	}
	use {
		'neovim/nvim-lspconfig',
		requires = { 'williamboman/nvim-lsp-installer' },
		config = function()
			require('plugins.lsp')
		end
	}
	use {
		'folke/lua-dev.nvim'
	}
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
			}
		end
	}
	use { 'tpope/vim-unimpaired' }
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require("luasnip")

			luasnip.config.set_config({ history = true })

			require("luasnip.loaders.from_vscode").lazy_load()

			if not pcall(require, "nvim-autopairs.completion.cmp") then
				cmp.event:on(
					"confirm_done",
					require("nvim-autopairs.completion.cmp").on_confirm_done { map_char = { text = "" } }
				)
			end

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end
				},
				view = {
					entries = "custom",
					selection_order = "near_cursor",
				},
				experimental = { native_menu = false, ghost_text = true },
				sortings = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = "luasnip" },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'path' },
					{ name = 'buffer' }
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
					['<CR>'] = cmp.mapping.confirm({ select = false }),
				}
			}
		end
	}
	use {
		"tamago324/lir.nvim",
		disable = false,
		requires = {
			"nvim-lua/plenary.nvim",
			-- "tamago324/lir-git-status.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			local actions = require "lir.actions"
			local mark_actions = require "lir.mark.actions"
			local clipboard_actions = require "lir.clipboard.actions"

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("lir").setup {
				show_hidden_files = true,
				devicons_enable = true,
				mappings = {
					["<CR>"] = actions.edit,
					["l"] = actions.edit,
					["<C-s>"] = actions.split,
					["<C-v>"] = actions.vsplit,
					["<C-t>"] = actions.tabedit,

					["h"] = actions.up,
					["-"] = actions.up,
					["q"] = actions.quit,

					["K"] = actions.mkdir,
					["N"] = actions.newfile,
					["R"] = actions.rename,
					["@"] = actions.cd,
					["Y"] = actions.yank_path,
					["."] = actions.toggle_show_hidden,
					["D"] = actions.delete,

					["J"] = function()
						mark_actions.toggle_mark("n")
					end,
					["C"] = clipboard_actions.copy,
					["X"] = clipboard_actions.cut,
					["P"] = clipboard_actions.paste,
				},
				hide_cursor = false,
			}

			vim.keymap.set("n", "§", "<CMD>e .<CR>", { desc = "Open current working directory" })
			vim.keymap.set("n", "-", "<CMD>e %:p:h<CR>", { desc = "Open parent directory" })
		end
	}
end)

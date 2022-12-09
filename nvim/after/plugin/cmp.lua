local has_cmp, cmp = pcall(require, "cmp")

if not has_cmp then
	vim.notify("cmp is missing", vim.log.levels.WARN)
	return
end

local luasnip = require("luasnip")

luasnip.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	region_check_events = "CursorHold",
	delete_check_events = "TextChanged"
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load()

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
		["<C-j>"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}
}

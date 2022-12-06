local has_lir, lir = pcall(require, "lir")

if not has_lir then
	vim.notify("lir is missing", vim.log.levels.WARN)
	return
end

local actions = require "lir.actions"
local mark_actions = require "lir.mark.actions"
local clipboard_actions = require "lir.clipboard.actions"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

lir.setup {
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

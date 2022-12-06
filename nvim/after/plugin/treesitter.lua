local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not has_treesitter then
	vim.notify("treesitter is missing", vim.log.levels.WARN)
	return
end

vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[set foldlevel=10]]

treesitter.setup {
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			}
		}
	},
	refactor = {
		highlight_definitions = {
			enable = true
		}
	}
}

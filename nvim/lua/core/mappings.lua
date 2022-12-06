local keymap = vim.keymap

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half page" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half page" })

local M = {}

M.telescope = function ()
	local telescope_builtin = require "telescope.builtin"
	keymap.set("n", "<leader>e", telescope_builtin.find_files, { desc = "Find files" })
	keymap.set("n", "<leader>o", telescope_builtin.buffers, { desc = "Buffers" })
end

return M

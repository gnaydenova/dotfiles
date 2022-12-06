local has_telescope, _ = pcall(require, "telescope")

if not has_telescope then
	vim.notify("telescope is missing", vim.log.levels.WARN)
	return
end

local telescope_builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>e", telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>o", telescope_builtin.buffers, { desc = "Buffers" })

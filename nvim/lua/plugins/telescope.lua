return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope_builtin = require "telescope.builtin"
		vim.keymap.set("n", "<leader>e", telescope_builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>o", telescope_builtin.buffers, { desc = "Buffers" })
	end
}

return {
	"folke/which-key.nvim",
	opts = {
		window = {
			border = "rounded",
			padding = { 1, 0, 1, 0 }
		}
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.register({ name = "+code" }, { prefix = "<leader>c" })
		wk.register({ name = "+dap" }, { prefix = "<leader>d" })
		wk.register({ name = "+persistance" }, { prefix = "<leader>p" })
		wk.register({ name = "+search" }, { prefix = "<leader>s" })
		wk.register({ name = "+tests" }, { prefix = "<leader>t" })
	end
}

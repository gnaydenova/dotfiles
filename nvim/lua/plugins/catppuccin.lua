return {
	"catppuccin/nvim",
	enabled = true,
	lazy = false,
	name = "catppuccin",
	opts = {
		flavour = "macchiato"
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}

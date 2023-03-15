return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = true,
	keys = {
		{
			"<leader>sl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore last session",
		},
		{
			"<leader>sr",
			function()
				require("persistence").load()
			end,
			desc = "Restore current dir session",
		},
	}
}

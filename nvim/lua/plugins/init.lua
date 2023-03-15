return {
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-unimpaired",
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/which-key.nvim",
		config = true,
		opts = {
			window = {
				border = "rounded",
				padding = { 1, 0, 1, 0 }
			}
		}
	},
	{
		"numToStr/Navigator.nvim",
		config = true,
		keys = {
			{ "<C-h>", "<cmd>NavigatorLeft<CR>",  desc = "Navigate Left" },
			{ "<C-j>", "<cmd>NavigatorDown<CR>",  desc = "Navigate Down" },
			{ "<C-k>", "<cmd>NavigatorUp<CR>",    desc = "Navigate Up" },
			{ "<C-l>", "<cmd>NavigatorRight<CR>", desc = "Navigate Right" },
		},
	},
	{
		"luukvbaal/statuscol.nvim",
		config = true,
	}
}
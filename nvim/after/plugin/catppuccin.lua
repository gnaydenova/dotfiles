local has_catppuccin, catppuccin = pcall(require, "catppuccin")

if not has_catppuccin then
	vim.notify("catppuccin is missing", vim.log.levels.WARN)
	return
end

catppuccin.setup({
	flavour = "macchiato"
})

vim.cmd.colorscheme "catppuccin"

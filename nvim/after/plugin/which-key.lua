local has_which_key, which_key = pcall(require, "which-key")

if not has_which_key then
	vim.notify("which-key is missing", vim.log.levels.WARN)
	return
end

which_key.setup {
}

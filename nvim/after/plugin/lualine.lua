local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
	vim.notify("lualine is missing", vim.log.levels.WARN)
	return
end

lualine.setup {
	options = {
		theme = 'catppuccin',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { { 'branch' }, { 'diff' }, { 'diagnostics', sources = { 'nvim_diagnostic' } } },
		lualine_c = { { 'filename', path = 1, newfile_status = true } },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
}

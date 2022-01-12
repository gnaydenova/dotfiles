local function on_attach(client, bufnr)
	vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"
	vim.opt_local.formatexpr = "v:lua.vim.lsp.formatexpr()"
end

local config = {
	sumneko_lua = require("lua-dev").setup {}
}

require('nvim-lsp-installer').on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
	if config[server.name] then
		opts = vim.tbl_extend('force', opts, config[server.name])
	end

	server:setup(opts)
end)

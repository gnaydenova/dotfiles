local has_lspconfig, lspconfig = pcall(require, "lspconfig")

if not has_lspconfig then
    vim.notify("lspconfig is missing", vim.log.levels.WARN)
    return
end

local function on_attach(_, bufnr)
	vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"
    vim.opt_local.formatexpr = "v:lua.vim.lsp.formatexpr()"

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        max_width = 80,
    })


	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

local config = {
	sumneko_lua = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace"
				}
			}
		}
	}
}

require("nvim-lsp-installer").setup {
    automatic_installation = true,
    ensure_installed = { "sumneko_lua" },
}

local function setup_server(server)
	local opts = {
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	}

	if server.name == "jsonls" then
		opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
	end

	if server.name == "sumneko_lua" then
		require("neodev").setup({})
	end

	if config[server.name] then
		---@diagnostic disable-next-line: cast-local-type
		opts = vim.tbl_extend("force", opts, config[server.name])
	end

	lspconfig[server.name].setup(opts)
end

for _, server in ipairs(require("nvim-lsp-installer.servers").get_installed_servers()) do
	setup_server(server)
end

local lsp_zero = require('lsp-zero')

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
    	"ts_ls",
    	"eslint",
    	"pyright",
    	"clangd",
    	"lua_ls",
    	"rust_analyzer",
    	"jdtls",
    	"texlab",
	}
})

local function lsp_attach(_, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "x" }, "<F3>", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
	vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.enable({
	"clangd",
	"eslint",
	"lua_ls",
	"pyright",
	"ts_ls",
	"rust_analyzer",
	"jdtls",
	"texlab",
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'buffer'},
	},
	snippet = {
		expand = function(args)
			require'luasnip'.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})


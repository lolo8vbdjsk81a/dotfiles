local lsp_zero = require('lsp-zero')

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'ts_ls',
		'eslint',
		'pyright',
		'clangd',
		'lua_ls', -- 'sumneko_lua' is now 'lua_ls' in newer versions
		'jdtls',
		'texlab',
	}
})

local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').clangd.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').ts_ls.setup({})
require('lspconfig').gleam.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').jdtls.setup({})
require('lspconfig').texlab.setup({})

---
-- Autocompletion setup
---
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
			-- You need Neovim v0.10 to use vim.snippet
			require'luasnip'.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})


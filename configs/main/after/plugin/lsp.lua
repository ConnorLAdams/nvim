---
-- LSP configuration
---
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
	vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "pyright", "marksman", "rust_analyzer" },
}
require('lspconfig').gleam.setup {}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').gopls.setup {}
require('lspconfig').pyright.setup {}
require('lspconfig').ts_ls.setup {}

local root_pattern = require('lspconfig.util').root_pattern
require('lspconfig').marksman.setup {
    root_dir = root_pattern('.git', '.marksman.toml'),
}

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

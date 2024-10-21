local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.nvim_workspace()

-- lsp.ensure_installed({
--	'clangd'
--    'pylyzer'
--   'ltex'
-- })

require'lspconfig'.clangd.setup{}

require'lspconfig'.gitlab_ci_ls.setup{}
require'lspconfig'.yamlls.setup{}

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bfr)
	local opts = { buffer = bfr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)


lsp.setup()

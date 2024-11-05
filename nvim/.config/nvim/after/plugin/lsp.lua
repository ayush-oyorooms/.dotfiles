local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.nvim_workspace()

lsp.ensure_installed({
    "clangd",
    "yamlls",
    "gopls",
    "pyright",
    "texlab",
    "gitlab_ci_ls",
})

lsp.configure("lua-language-server", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim"}
            }
        }
    }
})

-- this specific setting is no longer needed, because now we are (again)
-- setting the attach function globally, for all
--
-- require'lspconfig'.clangd.setup({on_attach = custom_attach})
-- require'lspconfig'.gitlab_ci_ls.setup({on_attach = custom_attach})
-- require'lspconfig'.yamlls.setup{on_attach = custom_attach}
-- require'lspconfig'.gopls.setup{on_attach = custom_attach}
-- require'lspconfig'.pyright.setup{on_attach = custom_attach}
-- require'lspconfig'.texlab.setup{on_attach = custom_attach}

lsp.on_attach(function (client, bfr)
	local opts = { buffer = bfr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts) -- code actions

    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>dl", function() vim.cmd("Telescope diagnostics") end, opts)
    vim.keymap.set("n", "<leader>di", function() vim.diagnostic.open_float() end, opts) -- diagnostic info
    end
)

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

lsp.setup()

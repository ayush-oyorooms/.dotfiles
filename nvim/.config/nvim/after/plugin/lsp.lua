local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.nvim_workspace()

lsp.ensure_installed({
    "clangd",
    "yamlls",
    "gopls",
    "pyright",
    "texlab",
    "lua_ls",
    "gitlab_ci_ls",
})

-- require ("lsp-zero").gitlab_ci_ls.setup()

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

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
    vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format({ bufnr = bfr }) end, opts, { desc = "format code according to lsp"})

    -- bro, gpt did this
    vim.keymap.set("x", "<leader>f", function()
        local start_line = vim.fn.line("'<") - 1  -- Start line (0-indexed)
        local end_line = vim.fn.line("'>") - 1    -- End line (0-indexed)

        vim.lsp.buf.format({
            range = {
                ["start"] = { line = start_line, character = 0 },
                ["end"] = { line = end_line, character = 0 },
            },
            bufnr = bfr
        })
    end, opts)
    -- till here

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

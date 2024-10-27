print(vim.cmd('echo "hiii"'))
print(vim.cmd('pwd'))

-- local lsp = require("after.plugin.lsp")

local client = vim.lsp.start_client {
    name = "custom-lsp",
    cmd = { "/Users/ayush/Desktop/learn/lsp-go/main" },
    on_attach = function ()
        print("custom LSP client attached successfully")
    end,
    on_error = function (err)
        print("custom lsp attaching mein error: ", err)
    end
}

if not client then
    vim.notify("incorrect client config provided")
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local attached = vim.lsp.buf_attach_client(0, client)
        if attached then
            print("successfully attached to current md file client")
        else
            print("attaching FAILED")
        end
    end
})

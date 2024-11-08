-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers

require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown()
        }
    }
}

require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "discover files across project" })

-- Searches for the input in the entire directory
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- find all the usages of the function below cursor
vim.keymap.set("n", "<leader>gs", function() builtin.lsp_references() end, {})

vim.keymap.set("n", "<C-h>", function() builtin.git_files() end, { desc = "discover in version controlled files" })
vim.keymap.set("n", "<C-f>", function() builtin.live_grep() end, { desc = "grep in real time respecting gitignore" })

vim.keymap.set("n", "<leader>h", function() builtin.command_history() end,
    { desc = "search through the recently executed commands (in command mode)" })
vim.keymap.set("n", "<leader>gj", function() builtin.jumplist() end, { desc = "go through jumplist entries" })
vim.keymap.set("n", "<leader>?", function() builtin.keymaps() end, { desc = "list all the keymappings" })
vim.keymap.set("n", "<leader>hs", function() builtin.keymaps() end, { desc = "go through search history" })
vim.keymap.set("n", "<leader>lr", function() builtin.oldfiles() end, { desc = "recently opened files" })

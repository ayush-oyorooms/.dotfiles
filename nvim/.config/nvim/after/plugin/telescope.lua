local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "discover files across project" })

-- Searches for the input in the entire directory
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") }) ;
end)

-- find all the usages of the function below cursor 
vim.keymap.set("n", "<leader>gs", function() builtin.lsp_references() end, {})

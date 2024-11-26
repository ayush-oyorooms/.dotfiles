-- set leader key
vim.g.mapleader = " "

-- open file explorer
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

-- next greatest remap ever : asbjornHaland
-- copies to system register
vim.keymap.set({ "v" }, "y", [["+y]])

-- previous in jump list
vim.keymap.set("n", "<leader>gl", "<C-t>")

-- a step back in navigation list
vim.keymap.set("n", "gb", "<C-o>")

-- ahead
vim.keymap.set("n", "ga", "<C-i>")
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "U", ":lua vim.cmd('redo') <CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "mk", ":! g++ vim.current.buffer.name")

-- print("sourced remaps")

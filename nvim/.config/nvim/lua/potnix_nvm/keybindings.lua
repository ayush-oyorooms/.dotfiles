vim.g.mapleader = " "

vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- print("source keybindings")

vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.cpp"},
    command = "0r ~/.vim/templates/cppFileInfra.cpp"
})
print("sourced autocmds")

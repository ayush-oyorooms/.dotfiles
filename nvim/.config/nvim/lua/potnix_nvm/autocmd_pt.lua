vim.api.nvim_create_autocmd({"BufNewFile"}, {
    pattern = {"*.cpp"},
    command = "0r ~/.vim/templates/cppFileInfra.cpp"
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gitlab-ci*.{yml,yaml}",
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
  end,
})
-- print("sourced autocmds")

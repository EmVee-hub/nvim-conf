require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

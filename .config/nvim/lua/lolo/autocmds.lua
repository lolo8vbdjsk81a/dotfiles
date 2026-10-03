local function indent(width, use_tabs)
  vim.opt_local.tabstop = width
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
  vim.opt_local.expandtab = not use_tabs
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "scss",
    "sass",
    "javascriptreact",
    "typescriptreact",
    "json",
    "jsonc",
    "yaml",
    "markdown",
    "lua",
  },
  callback = function()
    indent(2)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",
    "javascript",
    "typescript",
    "c",
    "cpp",
    "h",
    "hpp",
    "java",
    "cs",
    "php",
    "ruby",
  },
  callback = function()
    indent(4)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    indent(4, true)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    indent(4, true)
  end,
})


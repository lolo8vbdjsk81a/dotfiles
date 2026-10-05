require("nvim-treesitter").setup({
  ensure_installed = {
    "c",
    "cpp",
    "java",
    "javascript",
    "typescript",
    "tsx",
    "python",
    "rust",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "json",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "latex",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

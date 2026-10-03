# Common Lua layout
Credit to ThePrimeagen's tutorial

```
~/.config/nvim/
├── init.lua                     ← starts everything
├── lua/lolo/
│   ├── init.lua                 ← main personal settings/module loader
│   └── packer.lua               ← plugin list and Packer setup
└── after/plugin/
    ├── lsp.lua                  ← LSP configuration
    ├── telescope.lua            ← Telescope configuration
    └── treesitter.lua           ← Treesitter configuration
```



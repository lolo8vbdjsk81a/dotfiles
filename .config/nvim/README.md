## Neovim configuration
This Neovim configuration is written in Lua.

Credit to [ThePrimeagen’s Neovim configuration tutorial](https://www.youtube.com/watch?v=w7i4amO_zaE).

Based on ThePrimeagen's config, then changed some parts for my own use.

```text
~/.config/nvim/
├── init.lua                     ← Neovim entry point
├── lua/lolo/
│   ├── init.lua                 ← Loads my Lua modules
│   ├── options.lua              ← Editor options, leader key, colorscheme
│   ├── remap.lua                ← General keybindings
│   ├── autocmds.lua             ← Filetype-specific indentation settings
│   └── packer.lua               ← Plugin list and Packer setup
└── after/plugin/
    ├── lsp.lua                  ← Language servers, completion, LSP keymaps
    ├── telescope.lua            ← Fuzzy-finder keybindings
    └── treesitter.lua           ← Parser installation and syntax highlighting
```

### Startup flow
```text
Start Neovim
  ↓
~/.config/nvim/init.lua
  ↓
require("lolo")
  ↓
lua/lolo/init.lua
  ├── options.lua
  ├── remap.lua
  └── autocmds.lua
  ↓
require("lolo.packer")
  ↓
packer.lua loads/manages plugins
  ↓
after/plugin/*.lua configures installed plugins
```

### Keybindings
The leader key is Space.
```text
Space f f    Find files with Telescope
```

LSP mapping:
```
K             Show documentation
gd            Go to definition
gr            Find references
F2            Rename symbol
F3            Format code
F4            Code actions / quick fixes
```

### Plugin manager
Packer is used. It still works, but Packer is no longer maintained.


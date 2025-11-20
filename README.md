# Yukinord for Neovim

Neovim color scheme based on the VSCode theme inspired by [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code) and [Nord Deep](https://marketplace.visualstudio.com/items?itemName=marlosirapuan.nord-deep).

## Installation

### Using a plugin manager

#### Packer
```lua
use {
  'adibhanna/yukinord.nvim',
  config = function()
    vim.cmd([[colorscheme yukinord]])
  end
}
```

#### Lazy.nvim
```lua
{
  'adibhanna/yukinord.nvim',
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme yukinord]])
  end,
}
```

#### vim-plug
```vim
Plug 'adibhanna/yukinord.nvim'
colorscheme yukinord
```

### Manual installation

1. Copy `colors/yukinord.lua` to your Neovim colors directory:
   ```bash
   mkdir -p ~/.config/nvim/colors
   cp neovim/colors/yukinord.lua ~/.config/nvim/colors/yukinord.lua
   ```

2. Add to your `init.lua` or `init.vim`:
   ```lua
   vim.cmd('colorscheme yukinord')
   ```
   or
   ```vim
   colorscheme yukinord
   ```

## Features

- Full support for Treesitter syntax highlighting
- LSP semantic tokens support
- Comprehensive highlight groups for popular plugins:
  - NvimTree
  - Telescope
  - WhichKey
  - Cmp (nvim-cmp)
  - Gitsigns
  - Bufferline
  - Noice
  - Mini plugins
  - Snacks.nvim (pickers, notifier, zen mode, scratch buffers, and more)
  - And more
- Terminal colors support
- Proper diff highlighting
- Diagnostic highlights for errors, warnings, info, and hints

## Color Palette

- **Background**: `#1d2129` (main), `#14171d` (panels)
- **Foreground**: `#d8dee9` (default), `#eceff4` (active)
- **Cyan**: `#88c0d0` (keywords, accents)
- **Blue**: `#81a1c1` (info, links)
- **Green**: `#a3be8c` (types, classes)
- **Yellow**: `#ebcb8b` (numbers, functions, warnings)
- **Orange**: `#d08770` (strings)
- **Red**: `#bf616a` (errors)
- **Purple**: `#b48ead` (control keywords)

## Requirements

- Neovim 0.5+ (for Lua support)
- `termguicolors` enabled (recommended)

Add this to your config if not already set:
```lua
vim.o.termguicolors = true
```

## Troubleshooting

If you get an error like `Cannot find color scheme 'yukinord'`:

1. **For lazy.nvim**: Make sure you have `lazy = false` and `priority = 1000` in your plugin configuration (as shown above). This ensures the colorscheme loads immediately.

2. **Verify installation**: After installing, restart Neovim completely. The colorscheme should be available.

3. **Manual check**: You can verify the colorscheme is installed by running:
   ```lua
   :lua print(vim.fn.globpath(vim.fn.stdpath('data') .. '/lazy/yukinord.nvim', 'colors/yukinord.lua'))
   ```
   This should print the path to the colorscheme file.


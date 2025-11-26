# Yukinord for Neovim

Neovim color scheme based on the VSCode theme inspired by [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code) and [Nord Deep](https://marketplace.visualstudio.com/items?itemName=marlosirapuan.nord-deep).

## Preview

![Yukinord Preview 1](assets/image1.jpg)

![Yukinord Preview 2](assets/image2.jpg)

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

## Configuration

Yukinord supports optional configuration via the `setup` function. Call it **before** loading the colorscheme:

```lua
require("yukinord").setup({
  transparent = false,         -- Enable transparent background
  transparent_sidebar = false, -- Enable transparent background for sidebars (NvimTree, terminal, etc.)
})

vim.cmd([[colorscheme yukinord]])
```

### Options

| Option | Default | Description |
|--------|---------|-------------|
| `transparent` | `false` | Makes the main editor background transparent |
| `transparent_sidebar` | `false` | Makes sidebar backgrounds transparent (NvimTree, Snacks terminal, etc.) |

**Note:** When `transparent` is enabled, `transparent_sidebar` is also automatically enabled.

## Features

- Transparent background support (configurable)
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

- **Background**: `#1C212A` (main), `#14171d` (panels)
- **Foreground**: `#d8dee9` (default), `#eceff4` (active)
- **Cyan**: `#88c0d0` (keywords, accents)
- **Blue**: `#81a1c1` (info, links)
- **Green**: `#a3be8c` (types, classes)
- **Yellow**: `#ebcb8b` (numbers, functions, warnings)
- **Orange**: `#d08770` (strings)
- **Red**: `#bf616a` (errors)
- **Purple**: `#b48ead` (control keywords)

## Ghostty Terminal Theme

A matching Ghostty terminal theme is included in this repository. The theme file `Yukinord` provides a consistent color experience across Neovim and Ghostty terminal.

### Installation

Copy the contents of the `Yukinord` file and save it as a theme file in your Ghostty config themes directory (`~/.config/ghostty/themes/`), then set `theme = <filename>` in your Ghostty config.

The Ghostty theme includes:
- 16-color ANSI palette matching the Neovim colorscheme
- Background and foreground colors
- Cursor and selection colors
- All colors synchronized with the Neovim theme

## Requirements

- Neovim 0.5+ (for Lua support)
- `termguicolors` enabled (recommended)

Add this to your config if not already set:
```lua
vim.o.termguicolors = true
```


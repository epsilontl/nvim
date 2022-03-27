# Neovim configuration


This is my neovim's configuration.

**pros**
- Fast.
- Personalized yet generalized.After repeated screening, I kept the essential plugins and tried to use generalized mappings.
- Powerful. It has the speed of a text editor through the use of asynchronous processing, vim's efficient full keyboard use, IDE for handling various languages, and tools such as file management, floating terminal, lazygit, etc.
- Easy to customize.

Some results are displayed, in addition to powerful auto-completion and fuzzy search, floating terminal and other functions
![gitsign](https://github.com/epsilontl/nvim/blob/master/assets/gitsign.gif)
![lsp](https://github.com/epsilontl/nvim/blob/master/assets/lsp.gif)
![lazygit](https://github.com/epsilontl/nvim/blob/master/assets/lazygit.gif)

## Requirements

- [rigrep](https://github.com/BurntSushi/ripgrep#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [nodejs](https://nodejs.org/zh-cn/) [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)
- [lazygit](https://github.com/jesseduffield/lazygit#installation)
- [font](https://github.com/ryanoasis/nerd-fonts/releases)
  ```shell 
  sudo mkfontdir
  sudo mkfontscale
  fc-cache -fv
  ```
- [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) 
- pylint

## Installation

```bash
git clone https://github.com/epsilontl/nvim.git ~/.config/nvim

#open nvim,`<space>ps`,then nvim automatically install plugins, may need to be opened multiple times
```

## Keyboard Shortcuts

**my `<leader>` is `<space>`**
### normal

| Shortcut          | Action                       | Equivalent                      |
|-------------------|------------------------------|---------------------------------|
| `<leader>h`       | Move cursor one window left  | `<C-w>h`                        |
| `<leader>j`       | Move cursor one window down  | `<C-w>j`                        |
| `<leader>k`       | Move cursor one window up    | `<C-w>k`                        |
| `<leader>l`       | Move cursor one window right | `<C-w>l`                        |
| `<leader><arrow>` | Resize window                |                                 |
| `<leader>o`       | Spell Check                  | setlocal spell! spelllang=en_us |
| `<leader>3`       | turn off highlighting        |                                 |

### insert

| Shortcut | Action                                               |
|----------|------------------------------------------------------|
| `<C-u>`  | revoke                                               |
| `<C-a>`   | Move the cursor to the beginning of a non-blank line |

## Plugins and Keybindings

### ui

| Shortcut    | Action                             |
|-------------|------------------------------------|
| `]g`        | Jump to next git hunk              |
| `[g`        | Jump to previous git hunk          |
| `K`         | Preview git hunk                   |
| `<C-q>`     | Close buffer                       |
| `alt+num`   | Choose buffer                      |
| `<leader>1` | Open/Close nvim-tree               |
| `<leader>2` | Current file location in nvim-tree |
| `o`         | edit file or directory             |
| `a`         | Create a file or folder            |
| `x`         | Cut a file or folder               |
| `r`         | Rename                             |
| `c`         | copy                               |
| `p`         | paste                              |
| `<C-x>`     | split                              |
| `<C-v>`     | vsplit                             |
| `I`         | View hidden files                  |

### complete

**normal** 
| Shortcut    | Action           |
|-------------|------------------|
| `gd`        | Jump definitions |
| `gr`        | Show references  |
| `g[/]`      | Jump diagnostic  |
| `go`        | Show diagnostic  |
| `gh`        | Hover doc        |
| `sa`        | Code action      |
| `sn`        | Rename variable  |
| `<C-p>`     | Page up          |
| `<C-n>`     | Page down        |
| `<leader>a` | Float terminal   |
| `gq`        | Close terminal   |
| `<C-g>`     | Open lazygit     |

**insert cmp**
| Shortcut | Action                            |
|----------|-----------------------------------|
| `<C-j>`  | Select next completion option     |
| `<C-k>`  | Select previous completion option |
| `<C-h>`  | Select next snip option           |
| `<C-l>`  | Select previous snip option       |
| `<C-e>`  | Close completion                  |

### tools

| Shortcut           | Action                                |
|--------------------|---------------------------------------|
| `Cf`               | Search file                           |
| `Cw`               | Search word                           |
| `Co`               | Search old file                       |
| `Ch`               | Search help documentation             |
| `Cg`               | Search git file                       |
| `<C-p>`            | Page up                               |
| `<C-n>`            | Page down                             |
| `F5` or visual `r` | Run code                              |
| `<leader>r`        | View markdown                         |
| `<leader>tm`       | Vim-table-mode(markdown table format) |

### editor

| Shortcut | Action                        |
|----------|-------------------------------|
| `[[`     | go to previous function start |
| `]]`     | go to next function start     |
| `[m`     | go to previous class start    |
| `]m`     | go to next class start        |
| `%`      | Jump between matched text     |

## Ackowledgement

- [glepnir/nvim](https://github.com/glepnir/nvim) 
- [ayamir/nvimdots](https://github.com/ayamir/nvimdots)
- [askfiy/nvim](https://github.com/askfiy/nvim)
- [theniceboy/nvim](https://github.com/theniceboy/nvim)

| Plugins                       |
|-------------------------------|
| LuaSnip                       |
| bufferline.nvim               |
| cmp-buffer                    |
| cmp-nvim-lsp                  |
| cmp-nvim-lua                  |
| cmp-path                      |
| cmp-spell                     |
| cmp-tmux                      |
| cmp-under-comparator          |
| cmp_luasnip                   |
| edge                          |
| fidget.nvim                   |
| friendly-snippets             |
| fzy-lua-native                |
| gitsigns.nvim                 |
| indent-blankline.nvim         |
| lsp_signature.nvim            |
| lspsaga.nvim                  |
| lualine.nvim                  |
| markdown-preview.nvim         |
| nvim-autopairs                |
| nvim-cmp                      |
| nvim-comment                  |
| nvim-hlslens                  |
| nvim-lint                     |
| nvim-lsp-installer            |
| nvim-lspconfig                |
| nvim-tree.lua                 |
| nvim-treesitter               |
| nvim-treesitter-context       |
| nvim-treesitter-textobjects   |
| nvim-ts-context-commentstring |
| nvim-web-devicons             |
| packer.nvim                   |
| plenary.nvim                  |
| popfix                        |
| popup.nvim                    |
| sniprun                       |
| telescope-fzy-native.nvim     |
| telescope-project.nvim        |
| telescope.nvim                |
| vim-cursorword                |
| vim-eft                       |
| vim-matchup                   |
| vim-table-mode                |
| wilder.nvim                   |

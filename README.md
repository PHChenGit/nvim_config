# Neovim Configuration

Modular Neovim configuration built with Lua and [Lazy.nvim](https://github.com/folke/lazy.nvim) for C++ and Python development.

## Requirements

- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `xclip` or `wl-copy` (system clipboard)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live)
- Optional: `fd`, `ripgrep` (for Telescope)
- Optional: `npm` / `node` (for pyright LSP)
- Optional: [Zellij](https://zellij.dev/) (for pane navigation)

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone
git clone -b lazy-nvim-config git@github.com:PHChenGit/nvim_config.git ~/.config/nvim

# Launch — Lazy.nvim will auto-bootstrap and install all plugins
nvim
```

## Directory Structure

```
~/.config/nvim/
├── init.lua                     # Entry point: bootstrap Lazy.nvim, load modules
└── lua/
    ├── config/
    │   ├── options.lua          # vim.opt settings (indent, clipboard, line numbers)
    │   ├── keymaps.lua          # Leader key + global keymaps
    │   └── autocmds.lua         # Autocommands (yank highlight, trim whitespace)
    └── plugins/
        ├── ui.lua               # Catppuccin, lualine, bufferline, devicons
        ├── neo-tree.lua         # File explorer sidebar
        ├── telescope.lua        # Fuzzy finder + fzf-native
        ├── treesitter.lua       # Syntax highlighting + text objects
        ├── lsp.lua              # Mason + LSP configs (vim.lsp.config API)
        ├── cmp.lua              # Autocompletion + snippets
        ├── dap.lua              # Debugging (codelldb, nvim-dap-python)
        ├── utils.lua            # Utility plugins (see below)
        ├── zellij.lua           # Zellij pane navigation
        └── markdown.lua         # Markdown preview in browser
```

## Plugins

| Category | Plugins |
|---|---|
| UI | catppuccin, lualine, bufferline, nvim-web-devicons |
| File Explorer | neo-tree |
| Fuzzy Finder | telescope, telescope-fzf-native |
| Syntax | nvim-treesitter, nvim-treesitter-textobjects |
| LSP | mason, mason-lspconfig, nvim-lspconfig |
| Completion | nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path, LuaSnip, friendly-snippets |
| Debugging | nvim-dap, nvim-dap-ui, mason-nvim-dap, nvim-dap-python |
| Git | gitsigns |
| Navigation | flash.nvim, accelerated-jk, nvim-window-picker, zellij-nav |
| Editing | mini.ai, mini.comment, nvim-autopairs |
| Diagnostics | trouble.nvim |
| Code Outline | aerial.nvim |
| Keybindings | which-key.nvim |
| Markdown | markdown-preview.nvim |

## LSP Servers

Auto-installed via Mason:

| Server | Language |
|---|---|
| `clangd` | C / C++ (supports `compile_commands.json` for Qt/QMake) |
| `pyright` | Python (requires Node.js) |
| `lua_ls` | Lua |
| `marksman` | Markdown |
| `lemminx` | XML (Ant build files) |

## DAP (Debugging)

| Adapter | Language | Notes |
|---|---|---|
| `codelldb` | C / C++ | Auto-installed via Mason |
| `debugpy` | Python | Uses system `python3` |

## Keybindings

Leader key: `Space`

### General

| Key | Action |
|---|---|
| `<C-s>` | Save file |
| `<leader>q` | Quit all |
| `<leader>x` | Close buffer |
| `<leader>b` | New buffer |
| `jk` | Exit insert mode |

### Navigation

| Key | Action |
|---|---|
| `Tab` / `S-Tab` | Next / previous buffer |
| `<A-j>` / `<A-k>` | Previous / next buffer |
| `<C-h/j/k/l>` | Window / Zellij pane navigation |
| `<leader>sv` / `<leader>ss` | Vertical / horizontal split |
| `s` / `S` | Flash jump / treesitter select |

### File Explorer & Search

| Key | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree |
| `<leader>E` | Reveal file in Neo-tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fs` | Document symbols |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |

### Debugging

| Key | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue / start |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>du` | Toggle DAP UI |
| `<leader>dt` | Terminate |

### Git

| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

### Diagnostics

| Key | Action |
|---|---|
| `<leader>xx` | Workspace diagnostics (Trouble) |
| `<leader>xd` | Document diagnostics (Trouble) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>a` | Toggle aerial outline |

### Other

| Key | Action |
|---|---|
| `gc` / `gcc` | Comment (visual / line) |
| `<leader>mp` | Toggle markdown preview |
| `<leader>wp` | Pick window |

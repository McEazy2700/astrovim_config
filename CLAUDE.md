# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an **AstroNvim v4+** Neovim configuration using Lazy.nvim for plugin management. It is built on top of the AstroNvim distribution with AstroCommunity language packs.

## Code Quality

Lua code is formatted with **Stylua** and linted with **Selene**:

```sh
stylua lua/         # format all Lua files
selene lua/         # lint all Lua files
```

Stylua config: 120-column width, 2-space indent (`.stylua.toml`).
Selene config: Neovim standard library (`selene.toml`).

## Architecture

### Entry Point
- `init.lua` — bootstraps Lazy.nvim, then delegates to `lua/lazy_setup.lua`
- `lua/lazy_setup.lua` — defines all plugin sources including AstroNvim core, AstroCommunity packs, and user plugins from `lua/plugins/`
- `lua/community.lua` — imports AstroCommunity language/colorscheme packs
- `lua/polish.lua` — post-setup hook (currently empty/disabled)

### Plugin Config Files (`lua/plugins/`)
Each file returns a Lazy.nvim plugin spec table:

| File | Purpose |
|------|---------|
| `astrocore.lua` | Vim options, mappings, feature toggles (autopairs, cmp) |
| `astrolsp.lua` | LSP feature config (autoformat, codelens, inlay hints) |
| `astroui.lua` | Theme (tokyonight-night), icon overrides |
| `mason.lua` | Auto-install LSPs, formatters, debuggers |
| `none-ls.lua` | Null-ls sources (Stylua, Prettier) |
| `treesitter.lua` | Parsers and text object config |
| `lsp.lua` | Per-server LSP overrides |
| `mappings.lua` | Terminal and ZenMode keybindings |
| `claudecode.lua` | Claude Code plugin config and keybindings |
| `gemincli.lua` | Gemini CLI plugin config |
| `user.lua` | Miscellaneous user plugins |
| `personal.lua` | CodeSnap overrides |
| `spectre.lua` | nvim-spectre search/replace config |

### AstroNvim Module Pattern
Plugins are configured by returning opts overrides for AstroNvim's three core modules:
- **astrocore** — options, mappings, global settings
- **astrolsp** — LSP behavior (which servers, formatting rules)
- **astroui** — theme and icon configuration

### Language Support (AstroCommunity Packs)
Active packs in `community.lua`: Lua, Rust, TypeScript, JavaScript, Svelte, Python, Tailwind CSS, C++, Dart.

### Key Bindings
- Leader: `<Space>`, LocalLeader: `,`
- Terminals: `<M-f>` float, `<M-h>` horizontal, `<M-v>` vertical, `<M-b>` btop
- Claude Code: `<leader>ac` toggle, `<leader>af` focus, `<leader>ar` refresh, `<leader>as` send selection
- Gemini: `<M-i>` toggle (normal/visual/terminal)
- ZenMode: `<leader>az`
- Spectre: `<leader>lgr`
- CodeSnap: `<leader>cc` copy, `<leader>cs` save

### Installed Tooling (Mason)
- **LSPs:** `lua_ls`, `pyright`, `basedpyright`, `rust_analyzer`, `biome`
- **Formatters:** `prettier`, `stylua`
- **Debuggers:** `python`
- Rust LSP is managed by `rustaceanvim` (not mason-lspconfig)

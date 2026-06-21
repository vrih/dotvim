# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration repository written primarily in Lua. It uses lazy.nvim as the plugin manager.

## Installation

```bash
cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
```

## Architecture

**Entry point**: `init.lua` - Sets up lazy.nvim, configures leader key (Space), loads core modules, sets Neovim options, and configures LSP servers.

**Core modules** (in `lua/`):

- `plugins.lua` - Plugin definitions for lazy.nvim and loads plugin configurations
- `mappings.lua` - Global keybindings
- `autocommands.lua` - Auto-formatting, filetype detection, and whitespace highlighting
- `vimwiki.lua` - Vimwiki configuration

**Plugin configurations** (in `lua/plugins/`): Individual setup files for each plugin (telescope, lualine, gitsigns, nvim-cmp, formatter, etc.)

**Filetype-specific settings** (in `ftplugin/`): Per-language settings for Go, Java, JavaScript, Python, Terraform, Markdown, Ruby, etc.

**After-load overrides** (in `after/`): Filetype plugins, syntax, and indent customizations that load after plugins.

## Key Mappings

Leader key is Space. Key bindings:

- `<Leader>f` - Telescope find files
- `<Leader>a` - Telescope live grep
- `<Leader>b` - Telescope buffers
- `<Leader>n` - Toggle NvimTree
- `<Leader>t` - Toggle Tagbar
- `<Leader>gs` - Telescope git status
- `<Leader>gb` - Telescope git branches
- `]b` / `[b` - Next/previous buffer
- `]t` / `[t` - Next/previous tab

LSP mappings (when attached):

- `gd` - Go to definition
- `gD` - Go to declaration
- `K` - Hover
- `gr` - References
- `<Leader>ca` - Code action
- `<Leader>rn` - Rename

## LSP Servers

Configured servers: ansiblels, vimls, bashls, terraformls, gopls, pyright, yamlls

## Auto-formatting

Files are auto-formatted on save via formatter.nvim for: `*.lua`, `*.yaml`, `*.yml`, `*.scss`, `*.tf`, `*.py`

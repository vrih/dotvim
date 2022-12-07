local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-----------------------------------------------------------------------
-- Visual
-----------------------------------------------------------------------

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'pappasam/papercolor-theme-slim'

-----------------------------------------------------------------------
-- Filetypes
-----------------------------------------------------------------------

Plug 'fatih/vim-go'
Plug 'habamax/vim-asciidoctor'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'plasticboy/vim-markdown'
Plug('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install()'], ['for'] = {'markdown', 'vim-plug' }})
Plug 'aklt/plantuml-syntax'

-----------------------------------------------------------------------
-- Project
-----------------------------------------------------------------------

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug('lewis6991/gitsigns.nvim', { branch = 'main' })

-----------------------------------------------------------------------
-- Utility
-----------------------------------------------------------------------

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'chrisbra/unicode.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'reedes/vim-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tlib_vim'
Plug 'vim-syntastic/syntastic'
Plug 'simrat39/symbols-outline.nvim'


-- Add ale for hadolint
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate']})
Plug 'neovim/nvim-lspconfig'
Plug('hrsh7th/cmp-nvim-lsp', { branch = 'main' })
Plug('hrsh7th/cmp-buffer', { branch = 'main' })
Plug('hrsh7th/cmp-path', { branch = 'main' })
Plug('hrsh7th/cmp-cmdline', { branch = 'main' })
Plug('hrsh7th/nvim-cmp', { branch = 'main' })
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- dependencies
Plug 'nvim-lua/popup.nvim'
-- telescope
Plug 'nvim-telescope/telescope.nvim'
vim.call('plug#end')




require "plugins.lualine"
require "plugins.projectionist"
require "plugins.gitsigns"
require "plugins.syntastic"
require "plugins.nvim-web-devicons"


sectionlocal Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install()'], ['for'] = {'markdown', 'vim-plug' }})
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
Plug 'pappasam/papercolor-theme-slim'
Plug 'SirVer/ultisnips'
Plug 'habamax/vim-asciidoctor'
Plug 'honza/vim-snippets'
Plug 'chrisbra/unicode.vim'

-- Add ale for hadolint
Plug 'dense-analysis/ale'

Plug 'nvim-lua/plenary.nvim'
Plug('lewis6991/gitsigns.nvim', { branch = 'main' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate']})
Plug 'neovim/nvim-lspconfig'
Plug('hrsh7th/cmp-nvim-lsp', { branch = 'main' })
Plug('hrsh7th/cmp-buffer', { branch = 'main' })
Plug('hrsh7th/cmp-path', { branch = 'main' })
Plug('hrsh7th/cmp-cmdline', { branch = 'main' })
Plug('hrsh7th/nvim-cmp', { branch = 'main' })
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- dependencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
-- telescope
Plug 'nvim-telescope/telescope.nvim'
vim.call('plug#end')


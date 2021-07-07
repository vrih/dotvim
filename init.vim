call plug#begin('~/.config/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
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
Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
"Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'habamax/vim-asciidoctor'
Plug 'honza/vim-snippets'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plug 'chrisbra/unicode.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" dependencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

set nocompatible
filetype on
filetype plugin indent on
filetype indent on

if has('termguicolors')
  set termguicolors
endif

"highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set background=light
colorscheme PaperColor
highlight ColorColumn ctermbg=233 guibg=grey
set autoindent
set backspace=2
set completeopt=menuone,noselect
set encoding=utf-8
set expandtab

" Set format options
" w = trailing white space indicated paragraph continues into next line
" c = autowrap comments
" q = allow formatting of comments with gq
set formatoptions+=wcq
" t = auto wrap text using text width
set formatoptions-=t
set foldenable
set foldlevel=99
set foldmethod=syntax
set smartcase
set incsearch "" Incremental Search
set laststatus=2 " Always show status bar
set nobackup
set noshowmode
set nowrap
set nowritebackup
set number
set relativenumber
set signcolumn=yes
set smartindent
set title
set tw=79
set updatetime=300
set visualbell
set wildmenu
set wildmode=longest,list,full

syntax on

let mapleader="," "extend keyboard map options
noremap \ ,
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" :"\<tab>"
" Reload vimrc on save
filetype plugin on

autocmd FileType md set filetype=markdown
autocmd FileType rb set filetype=ruby
autocmd BufRead,BufNewFile /tmp/*.md setlocal ft=markdown.glab

highlight User1 guifg=#eea040 guibg=#222222
highlight User2 guifg=#dd3333 guibg=#222222
highlight User3 guifg=#ff66ff guibg=#222222
highlight User4 guifg=#a0ee40 guibg=#222222
highlight User5 guifg=#eeee40 guibg=#222222

autocmd BufNewFile,BufRead " indenting shortcuts
vnoremap < <gv
vnoremap > >gv

"==============
" ctrlp
" ===========
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height=30

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
function! OmniPopup(action)
if pumvisible()
if a:action == 'j'
return "\<C-N>"
elseif a:action == 'k'
return "\<C-P>"
endif
endif
return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Tab Completion
" Super Tab
" http://www.vim.org/scripts/script.php?script_id=1643
"let g:SuperTabMappingForward = "<nul>"
"let g:SuperTabMappingLiteral = "<Tab>"
"let g:SuperTabDefaultCompletionType = "context"

" Pencil
augroup pencil
  autocmd!
  "autocmd FileType markdown,md call pencil#init()
"  autocmd FileType text         call pencil#init()
augroup END

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:projectionist_heuristics = {
            \ '*.go': {
            \   '*.go': {
            \       'alternate': '{}_test.go',
            \       'type': 'source'
            \   },
            \   '*_test.go': {
            \       'alternate': '{}.go',
            \       'type': 'test'
            \   },
            \  },
            \'vue.config.js': {
            \   'src/*.vue': { 'alternate': 'tests/unit/{}.spec.js' },
            \   'src/*.js': { 'alternate': 'tests/unit/{}.spec.js' },
            \   "tests/unit/*.spec.js": { "dispatch": "yarn test:unit {file}" }
            \}}

" Abbreviations
iabbrev mon Monday
iabbrev tue Tuesday
iabbrev wed Wednesday
iabbrev thu Thursday
iabbrev fri Friday
iabbrev sat Saturday
iabbrev sun Sunday

iabbrev zjpm @john.medforth.consultant
iabbrev zdim @dimitrij.denissenko.consultant

let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let g:vimwiki_list = [{'path': '~/wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

augroup blanks
        autocmd!
        autocmd BufWritePre * call FixBlankLines()
augroup END

nnoremap <silent> <leader>e :Files<cr>
nnoremap <silent> <leader>f <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>a <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>

nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>t :Tagbar<cr>

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
"  Gitlab token
let g:gitlab_api_keys = {'gitlab.com': $CI_JOB_TOKEN}
" Update sign column every quarter second
set updatetime=250
" Set filetype for daily scrum
autocmd BufRead,BufNewFile ~/Documents/journal/* set syntax=markdown

nnoremap <silent> <leader>m :Asciidoctor2HTML<cr>

let g:lightline = {
  \   'colorscheme': 'PaperColor_light',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

autocmd BufRead, *.rb nmap <leader>r :silent !{ruby %}<cr>

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

local servers = {'pyright', 'solargraph', 'vimls'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
  }
EOF

lua << EOF
require 'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    nvim_lsp = true;
  };
}
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "🔎 ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

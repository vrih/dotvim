verbose set expandtab
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jcrocholl/pep8', {'for': 'python' }
Plug 'klen/python-mode', {'for': 'python' }
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'vim-syntastic/syntastic'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set nocompatible

filetype on
set smartindent
set autoindent
filetype indent on
filetype plugin indent on
"work in utf-8
set encoding=utf-8
set expandtab
set fo+=w
set ignorecase
set title
set noshowmode
set termguicolors

"highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set background=dark
colorscheme gruvbox
syntax on
map T :TaskList<CR>
set bs=2
set spell
set visualbell
set incsearch "" Incremental Search
set guifont="Source Code Pro"
set laststatus=2 " Always show status bar
set relativenumber
set clipboard=unnamed " use system clipboard

set wildmode=longest,list,full
set wildmenu

let mapleader="," "extend keyboard map options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" :"\<tab>"
" Reload vimrc on save
filetype plugin on

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType md set filetype=markdown
autocmd FileType rb set filetype=ruby

" AdWords specific files
autocmd FileType keys set filetype=aw_keywords

" Set statusline
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

autocmd BufNewFile,BufRead " indenting shortcuts
vnoremap < <gv
vnoremap > >gv

set number
set fo-=t
set tw=79
set nowrap
highlight ColorColumn ctermbg=233 guibg=grey

set nobackup
set nowritebackup
set noswapfile

"==============
" ctrlp
" ===========
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height=30

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
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

set foldenable
set foldmethod=syntax
set foldlevel=99

" Tab Completion
" Super Tab
" http://www.vim.org/scripts/script.php?script_id=1643
let g:SuperTabMappingForward = "<nul>"
let g:SuperTabMappingLiteral = "<Tab>"
let g:SuperTabDefaultCompletionType = "context"

" Pencil
augroup pencil
  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
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
            \}}

" Abbreviations
iabbrev mon Monday
iabbrev tue Tuesday
iabbrev wed Wednesday
iabbrev thu Thursday
iabbrev fri Friday
iabbrev sat Saturday
iabbrev sun Sunday

let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
set updatetime=300
set signcolumn=yes
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

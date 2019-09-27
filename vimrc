verbose set expandtab
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jcrocholl/pep8', {'for': 'python' }
Plug 'klen/python-mode', {'for': 'python' }
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
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

"au BufRead,BufNewFile *.md set filetype=markdown
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

au! Syntax searchterm source "~/vimfiles/syntax/searchterm.vim"

"highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme evening
syntax on
map T :TaskList<CR>
set bs=2
set spell
set visualbell
set incsearch "" Incremental Search
set guifont=Source\ Code\ Pro\ 11
set laststatus=2 " Always show status bar

set clipboard=unnamed " use system clipboard

set wildmode=longest,list,full
set wildmenu

let mapleader="," "extend keyboard map options

" Reload vimrc on save
autocmd! bufwritepost .vimrc source %

filetype plugin on

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType md set filetype=markdown
autocmd FileType rb set filetype=ruby

" AdWords specific files
autocmd FileType keys set filetype=aw_keywords

" CSV files
:let g:csv_delimeter = "\t"

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
"set foldmethod=indent
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

if executable('terraform-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-lsp',
        \ 'cmd': {server_info->['terraform-lsp -enable-log-file']},
        \ 'whitelist': ['terraform'],
        \ })
endif

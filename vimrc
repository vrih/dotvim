filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on

"work in utf-8
set encoding=utf-8

set fo+=w

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
"set guifont=Source_Code_Pro_Regular
"set guifont=Ubuntu\ Mono\ 10
set laststatus=2 " Always show status bar

set clipboard=unnamed " use system clipboard

set wildmode=longest,list,full
set wildmenu

let mapleader="," "extend keyboard map options


" Reload vimrc on save
autocmd! bufwritepost .vimrc source %

filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete#Complete
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


" Open links in a browser
function! Browser()
	let line = getline(".")
	let line = matchstr(line,"^[^ $,;\t]*")
	exec "!start C:\\Users\\Daniel.Bowtell\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe ".line
endfunction
map <C-F1> :call Browser ()<CR>


function! Browser2()
	let line = getline(".")
	let line = matchstr(line,"http:[^ $,;\t]*")
	exec "!start C:\\Users\\Daniel.Bowtell\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe ".line
endfunction
map <C-F2> :call Browser2 ()<CR>

autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set smarttab |
    \ set shiftround |
    \ set expandtab |
    \ set colorcolumn=81

" indenting shortcuts
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

"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl 'www.vim.org/scripts/download_script.php?src_id=16224' \
"  > ~/.vim/autoload/pathogen.vim
call pathogen#infect()

"==============
" ctrlp
" ===========
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height=30


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

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


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"
" set nofoldenable
set foldmethod=indent
set foldlevel=99


" Tab Completion
" Super Tab
" http://www.vim.org/scripts/script.php?script_id=1643
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabMappingForward = "<nul>"
let g:SuperTabMappingLiteral = "<Tab>"
let g:SuperTabDefaultCompletionType = "context"

" Terraform
let g:terraform_align=2
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

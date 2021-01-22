call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'jcrocholl/pep8', {'for': 'python' }
Plug 'klen/python-mode', {'for': 'python' }
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'habamax/vim-asciidoctor'
Plug 'honza/vim-snippets'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
call plug#end()

set nocompatible

filetype on
filetype plugin indent on
filetype indent on

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
set completeopt=longest,menuone,preview
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
  " Use `complete_info` if your (Neo)Vim version supports it.
"if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_snippet_next = '<tab>'

" Coc plugins
" coc-snippets
" coc-go
" coc-json
" coc-solargraph
" coc-prettier
" coc-yaml
" coc-vetur
" coc-eslint

let g:vimwiki_list = [{'path': '~/wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

augroup blanks
        autocmd!
        autocmd BufWritePre * call FixBlankLines()
augroup END

nnoremap <silent> <leader>e :Files<cr>
nnoremap <silent> <leader>f :GFiles<cr>
nnoremap <silent> <leader>a :Ag<cr>
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>t :Tagbar<cr>

" Git mappings 
" https://jakobgm.com/posts/vim/git-integration/
nmap ]h :GitGutterNextHunk<cr>
nmap [h :GitGutterPrevHunk<cr>
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga :GitGutterStageHunk<cr>
nmap <Leader>gu :GitGutterUndoHunk<cr>

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
